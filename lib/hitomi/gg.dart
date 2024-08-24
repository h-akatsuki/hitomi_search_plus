import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gg.g.dart';

class M {
  Set<int> ids;
  int defaultValue;
  int matchValue;

  M(this.ids, this.defaultValue, this.matchValue);

  int m(int g) {
    if (ids.contains(g)) {
      return matchValue;
    } else {
      return defaultValue;
    }
  }
}

int _hexToInt(String hex) {
  switch (hex) {
    case '0':
      return 0;
    case '1':
      return 1;
    case '2':
      return 2;
    case '3':
      return 3;
    case '4':
      return 4;
    case '5':
      return 5;
    case '6':
      return 6;
    case '7':
      return 7;
    case '8':
      return 8;
    case '9':
      return 9;
    case 'a':
      return 10;
    case 'b':
      return 11;
    case 'c':
      return 12;
    case 'd':
      return 13;
    case 'e':
      return 14;
    case 'f':
      return 15;
    default:
      throw Exception('invalid hex');
  }
}

class GGJS {
  M m;
  int b;

  GGJS(this.m, this.b);

  static GGJS fromJS(String text) {
    final m = M({}, 0, 0);
    int b = 0;

    for (final line in text.split('\n')) {
      if (line.isEmpty) {
        continue;
      }

      final parts = line.split(' ');
      final key = parts[0];

      switch (key) {
        case 'case':
          final idText = parts[1].replaceFirst(":", "");
          final id = int.parse(idText);
          m.ids.add(id);
          break;
        case 'var':
          final valueText = parts[3].replaceAll(";", "");
          m.defaultValue = int.parse(valueText);
          break;
        case 'o':
          final valueText = parts[2].replaceAll(";", "");
          m.matchValue = int.parse(valueText);
          break;
        case 'b:':
          final valueText = parts[1].replaceAll(RegExp(r'[^\d]'), "");
          b = int.parse(valueText);
          break;
      }
    }

    return GGJS(m, b);
  }

  int s(String h) {
    final len = h.length;
    if (len < 3) {
      throw Exception('invalid h');
    }

    int res = 0;
    res += _hexToInt(h[len - 1]) * 256;
    res += _hexToInt(h[len - 2]);
    res += _hexToInt(h[len - 3]) * 16;

    return res;
  }

  static Future<GGJS> init() async {
    const url = "https://ltn.hitomi.la/gg.js";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) {
      throw Exception(
          'Failed to load GGJS (status code: ${response.statusCode})');
    }
    final text = response.body;
    return GGJS.fromJS(text);
  }
}

@Riverpod(keepAlive: true)
class GG extends _$GG {
  @override
  Future<GGJS> build() async {
    Future.delayed(const Duration(seconds: 1), worker);
    return GGJS.init();
  }

  void worker() async {
    int min = 30;
    while (true) {
      await Future.delayed(Duration(minutes: min));
      try {
        final gg = await GGJS.init();
        state = AsyncValue.data(gg);
        min = 30;
      } catch (e) {
        debugPrint(e.toString());
        min = 1;
      }
    }
  }
}
