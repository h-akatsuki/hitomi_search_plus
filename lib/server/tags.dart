import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hitomi_search_plus/main.dart';
import 'package:hitomi_search_plus/src/rust/api/suggest.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

const String url = 'https://hitomi.hiro.red/tags';

extension TagConverter on TagType {
  String toText() {
    switch (this) {
      case TagType.artist:
        return 'artist';
      case TagType.character:
        return 'character';
      case TagType.group:
        return 'group';
      case TagType.language:
        return 'language';
      case TagType.parody:
        return 'parody';
      case TagType.type:
        return 'type';
      case TagType.female:
        return 'female';
      case TagType.male:
        return 'male';
      case TagType.tag:
        return 'tag';
    }
  }

  IconData toIcon() {
    switch (this) {
      case TagType.artist:
        return Icons.person;
      case TagType.character:
        return Icons.face;
      case TagType.group:
        return Icons.group;
      case TagType.language:
        return Icons.language;
      case TagType.parody:
        return Icons.book;
      case TagType.type:
        return Icons.category;
      case TagType.female:
        return Icons.female;
      case TagType.male:
        return Icons.male;
      case TagType.tag:
        return Icons.tag;
      default:
        return Icons.error;
    }
  }

  static TagType? fromTextFlex(String s) {
    const names = [
      ("artist", TagType.artist),
      ("character", TagType.character),
      ("group", TagType.group),
      ("language", TagType.language),
      ("parody", TagType.parody),
      ("female", TagType.female),
      ("male", TagType.male),
      ("tag", TagType.tag),
      ("type", TagType.type),
    ];
    for (final name in names) {
      final key = name.$1;
      if (key.startsWith(s)) {
        return name.$2;
      }
    }
    return null;
  }
}

Future<File> download() async {
  final response = await http.get(Uri.parse(url));
  final status = response.statusCode;
  if (200 <= status && status < 300) {
    final file = File(path.join(appDocDir.path, 'tags.bin'));
    await file.writeAsBytes(response.bodyBytes);
    return file;
  } else {
    throw Exception('Failed to download tags: $status');
  }
}

late Future<TagSuggest> tagsSuggest;
void initTagsSuggest() {
  Future<TagSuggest> load() async {
    final file = File(path.join(appDocDir.absolute.path, 'tags.bin'));
    if (!file.existsSync()) {
      await download();
    }
    return TagSuggest.newInstance(path: file.path);
  }
  tagsSuggest = load();
}

enum TokenType {
  text,
  colon,
  quote,
  minus,
  pipe,
  ampersand,
  leftParen,
  rightParen,
  backslash,
  space
}

class Token {
  final TokenType type;
  final String value;
  Token(this.type, this.value);

  @override
  String toString() => 'Token(${type.toString().split('.').last}, "$value")';
}

class SuggestionResult {
  final String? category;
  final String? name;
  SuggestionResult(this.category, this.name);

  @override
  String toString() => 'category:$category, name:$name';
}

List<Token> tokenize(String query) {
  List<Token> tokens = [];
  StringBuffer buffer = StringBuffer();
  bool inQuote = false;
  String? quoteChar;
  bool escaped = false;

  void addToken(TokenType type) {
    if (buffer.isNotEmpty) {
      tokens.add(Token(type, buffer.toString()));
      buffer.clear();
    }
  }

  for (int i = 0; i < query.length; i++) {
    String char = query[i];

    if (escaped) {
      buffer.write(char);
      escaped = false;
      continue;
    }

    if (inQuote) {
      if (char == quoteChar) {
        inQuote = false;
        addToken(TokenType.text);
        tokens.add(Token(TokenType.quote, char));
        quoteChar = null;
      } else {
        buffer.write(char);
      }
    } else {
      switch (char) {
        case "'":
        case '"':
          addToken(TokenType.text);
          inQuote = true;
          quoteChar = char;
          tokens.add(Token(TokenType.quote, char));
          break;
        case ':':
          addToken(TokenType.text);
          tokens.add(Token(TokenType.colon, ':'));
          break;
        case '-':
          addToken(TokenType.text);
          tokens.add(Token(TokenType.minus, '-'));
          break;
        case '|':
          addToken(TokenType.text);
          tokens.add(Token(TokenType.pipe, '|'));
          break;
        case '&':
          addToken(TokenType.text);
          tokens.add(Token(TokenType.ampersand, '&'));
          break;
        case '(':
          addToken(TokenType.text);
          tokens.add(Token(TokenType.leftParen, '('));
          break;
        case ')':
          addToken(TokenType.text);
          tokens.add(Token(TokenType.rightParen, ')'));
          break;
        case '\\':
          escaped = true;
          break;
        case ' ':
          addToken(TokenType.text);
          tokens.add(Token(TokenType.space, ' '));
          break;
        default:
          buffer.write(char);
      }
    }
  }
  addToken(TokenType.text);
  return tokens.where((token) => token.value.isNotEmpty).toList();
}

SuggestionResult extractSuggestion(String query) {
  List<Token> tokens = tokenize(query);
  if (tokens.isEmpty) {
    return SuggestionResult(null, null);
  }
  final last = tokens.last;
  if (last.type != TokenType.text) {
    return SuggestionResult(null, null);
  }
  int index = tokens.length - 2;
  bool quoteFlag = false;
  while (index >= 0) {
    if (tokens[index].type == TokenType.quote) {
      if (quoteFlag) {
        return SuggestionResult(null, last.value);
      } else {
        quoteFlag = true;
      }
    } else {
      if (tokens[index].type == TokenType.colon) {
        index--;
        break;
      }
      if (tokens[index].type != TokenType.space) {
        return SuggestionResult(null, last.value);
      }
    }
    index--;
  }

  if (index == -1) {
    return SuggestionResult(null, last.value);
  }

  while (index >= 0) {
    if (tokens[index].type == TokenType.text) {
      return SuggestionResult(tokens[index].value, last.value);
    }
    if (tokens[index].type == TokenType.space) {
      index--;
    } else {
      return SuggestionResult(null, last.value);
    }
  }

  return SuggestionResult(null, last.value);
}

String applySuggestion(String query, String? category, String name) {
  List<Token> tokens = tokenize(query);
  final int quoteFix =
      tokens.where((token) => token.type == TokenType.quote).length % 2;
  if (tokens.isEmpty) {
    return "$category:'$name' ";
  }
  final last = tokens.last;
  if (last.type != TokenType.text) {
    return "$category:'$name' ";
  }
  int index = tokens.length - 2;
  bool quoteFlag = false;

  String apply() {
    if (index < 0) {
      return "$category:'$name' ";
    }
    tokens.removeRange(index, tokens.length);
    tokens.add(Token(TokenType.text, "$category:'$name' "));
    return tokens.map((token) => token.value).join();
  }

  while (index >= 0) {
    if (tokens[index].type == TokenType.quote) {
      if (quoteFlag) {
        index = tokens.length - 1 - quoteFix;
        return apply();
      } else {
        quoteFlag = true;
      }
    } else {
      if (tokens[index].type == TokenType.colon) {
        index--;
        break;
      }
      if (tokens[index].type != TokenType.space) {
        index = tokens.length - 1 - quoteFix;
        return apply();
      }
    }
    index--;
  }

  if (index == -1) {
    index = tokens.length - 1 - quoteFix;
    return apply();
  }

  while (index >= 0) {
    if (tokens[index].type == TokenType.text) {
      return apply();
    }
    if (tokens[index].type == TokenType.space) {
      index--;
    } else {
      index = tokens.length - 1;
      return apply();
    }
  }

  index = tokens.length - 1;
  return apply();
}
