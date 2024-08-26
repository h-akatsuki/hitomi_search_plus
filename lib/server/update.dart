import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'update.g.dart';

const v = 'v0.2.2';

@Riverpod(keepAlive: true)
class LatestVersion extends _$LatestVersion {
  @override
  Future<String> build() async {
    const String githubApiUrl =
        'https://api.github.com/repos/h-akatsuki/hitomi_search_plus/releases/latest';

    try {
      final response = await http.get(
        Uri.parse(githubApiUrl),
        headers: {'Accept': 'application/vnd.github.v3+json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['tag_name'];
      } else {
        throw Exception('Failed to load latest version');
      }
    } catch (e) {
      debugPrint('Error fetching latest version: $e');
      rethrow;
    }
  }

  Future<bool> isUpdateAvailable() async {
    final data = await future;
    return data != v;
  }
}

class UpdateManager {
  static Future<void> launchUpdaterAndExit(
      BuildContext context, String v) async {
    try {
      final exeDir = Directory.current;
      final updaterPath = path.join(exeDir.path, 'updater.bat');
      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Update Available: $v'),
            content: const Text(
                'An update is available. The application will close and update now.'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      await Process.start(updaterPath, []);
      Future.delayed(const Duration(seconds: 1), () {
        exit(0);
      });
    } catch (e) {
      debugPrint('Error launching updater: $e');
      return;
    }
  }
}
