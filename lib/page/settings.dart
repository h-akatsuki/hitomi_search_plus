import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hitomi_search_plus/component/thumbnail.dart';
import 'package:hitomi_search_plus/db/cbz.dart';
import 'package:hitomi_search_plus/db/kv.dart';
import 'package:hitomi_search_plus/db/manager.dart';
import 'package:hitomi_search_plus/server/query.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings.g.dart';

late final ThemeMode initialThemeMode;

const key = 'theme_mode';
Future<void> initSettings() async {
  final data = await getKV(key);
  switch (data) {
    case 'light':
      initialThemeMode = ThemeMode.light;
      break;
    case 'dark':
      initialThemeMode = ThemeMode.dark;
      break;
    default:
      initialThemeMode = ThemeMode.system;
  }
}

@riverpod
class ThemeSetting extends _$ThemeSetting {
  @override
  ThemeMode build() {
    return initialThemeMode;
  }

  Future<void> set(ThemeMode value) {
    state = value;
    switch (value) {
      case ThemeMode.light:
        return setKV(key, 'light');
      case ThemeMode.dark:
        return setKV(key, 'dark');
      default:
        return setKV(key, 'system');
    }
  }
}

class SettingsScreen extends HookConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeSettingProvider);
    final useJp = ref.watch(useJapaneseProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Theme Mode'),
            trailing: DropdownButton<ThemeMode>(
              value: themeMode,
              onChanged: (ThemeMode? newValue) {
                if (newValue != null) {
                  ref.read(themeSettingProvider.notifier).set(newValue);
                }
              },
              items: const [
                DropdownMenuItem(
                    value: ThemeMode.system, child: Text('System')),
                DropdownMenuItem(value: ThemeMode.light, child: Text('Light')),
                DropdownMenuItem(value: ThemeMode.dark, child: Text('Dark')),
              ],
            ),
          ),
          const Divider(),
          BooleanSettingItem(
            title: 'Use Japanese Title',
            initialValue: useJp,
            onChanged: (_) {
              ref.read(useJapaneseProvider.notifier).toggle();
            },
          ),
          const Divider(),
          TextSettingItem(
            title: 'Override search api',
            initialValue: ref.read(queryAPIUriProvider),
            onChanged: (String value) {
              ref.read(queryAPIUriProvider.notifier).set(value);
            },
          ),
          const Divider(),
          const SetDownloadDir(),
          const Divider(),
          const DeleteImageCacheButton(),
        ],
      ),
    );
  }
}

class SetDownloadDir extends HookConsumerWidget {
  const SetDownloadDir({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final downloadDir = ref.watch(downloadDirProvider);
    return ListTile(
      title: const Text('Download Directory'),
      subtitle: Text(downloadDir.value?.path ?? 'Not set'),
      trailing: IconButton(
        icon: const Icon(Icons.folder_open),
        onPressed: () async {
          final result = await FilePicker.platform.getDirectoryPath();
          if (result != null) {
            await ref.read(downloadDirProvider.notifier).set(Directory(result));
          }
        },
      ),
    );
  }
}

class BooleanSettingItem extends StatelessWidget {
  final String title;
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const BooleanSettingItem({
    super.key,
    required this.title,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(title),
      value: initialValue,
      onChanged: onChanged,
    );
  }
}

class TextSettingItem extends StatelessWidget {
  final String title;
  final String initialValue;
  final ValueChanged<String> onChanged;

  const TextSettingItem({
    super.key,
    required this.title,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: SizedBox(
        width: 200,
        child: TextField(
          controller: TextEditingController(text: initialValue),
          onChanged: onChanged,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}

enum CacheStatus {
  idle,
  deleting,
  done,
}

class DeleteImageCacheButton extends HookConsumerWidget {
  const DeleteImageCacheButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = useState<CacheStatus>(CacheStatus.idle);
    return ListTile(
      title: const Text('Cache Management'),
      subtitle: const Text('Delete all image caches from unliked galleries'),
      trailing: status.value == CacheStatus.deleting
          ? const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : IconButton(
              icon: Icon(
                status.value == CacheStatus.done
                    ? Icons.check_circle
                    : Icons.delete_outline,
                color: status.value == CacheStatus.done
                    ? Colors.green
                    : Theme.of(context).colorScheme.primary,
              ),
              onPressed: status.value == CacheStatus.idle
                  ? () async {
                      status.value = CacheStatus.deleting;
                      await deleteUnlikedGalleryCache();
                      status.value = CacheStatus.done;
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Cache cleared successfully'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    }
                  : null,
            ),
    );
  }
}
