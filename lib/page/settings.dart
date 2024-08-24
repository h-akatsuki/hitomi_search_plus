import 'package:flutter/material.dart';
import 'package:hitomi_search_plus/component/thumbnail.dart';
import 'package:hitomi_search_plus/db/kv.dart';
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
        ],
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
