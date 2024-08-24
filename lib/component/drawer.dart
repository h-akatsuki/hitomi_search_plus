import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hitomi_search_plus/page/history.dart';
import 'package:hitomi_search_plus/page/search.dart';
import 'package:hitomi_search_plus/page/settings.dart';
import 'package:hitomi_search_plus/tools/suger.dart';
import 'package:hitomi_search_plus/tools/url.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'drawer.g.dart';

@riverpod
bool isMouseDevice(IsMouseDeviceRef ref) {
  // TODO: Need more effective way to detect mouse device
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    return true;
  } else {
    return false;
  }
}

class AdaptiveScaffold extends HookConsumerWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final List<Widget>? persistentFooterButtons;
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;
  final double breakpoint;
  final double hoverWidth;

  const AdaptiveScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.persistentFooterButtons,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.breakpoint = 1000,
    this.hoverWidth = 20,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMouseDevice = ref.watch(isMouseDeviceProvider);
    final isWideScreen = MediaQuery.of(context).size.width > breakpoint;
    final isDrawerOpen = useState(false);
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 200),
      initialValue: isWideScreen ? 1 : 0,
    );

    useEffect(() {
      if (isWideScreen || isDrawerOpen.value) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
      return null;
    }, [isWideScreen, isDrawerOpen.value]);

    if (!isMouseDevice) {
      return Scaffold(
        appBar: appBar,
        body: body,
        drawer: const Drawer(child: CustomDrawer()),
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        persistentFooterButtons: persistentFooterButtons,
        backgroundColor: backgroundColor,
      );
    }

    Widget scaffoldBody = Scaffold(
      appBar: appBar,
      body: body,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      persistentFooterButtons: persistentFooterButtons,
      backgroundColor: backgroundColor,
      bottomNavigationBar: bottomNavigationBar,
    );

    return MouseRegion(
      onHover: (event) {
        if (event.position.dx < hoverWidth && !isWideScreen) {
          isDrawerOpen.value = true;
        }
      },
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Stack(
            children: [
              if (isWideScreen)
                Row(
                  children: [
                    const SizedBox(
                      width: 300,
                      child: Material(
                        elevation: 16,
                        child: CustomDrawerPC(),
                      ),
                    ),
                    Expanded(
                      child: scaffoldBody,
                    ),
                  ],
                )
              else
                scaffoldBody,
              if (!isWideScreen)
                Positioned(
                  left: -300 + (300 * animationController.value),
                  top: 0,
                  bottom: 0,
                  width: 300,
                  child: MouseRegion(
                    onExit: (_) {
                      if (!isWideScreen) {
                        isDrawerOpen.value = false;
                      }
                    },
                    child: const Material(
                      elevation: 16,
                      child: CustomDrawerPC(),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class LinkItem {
  final String title;
  final String url;
  final IconData icon;

  const LinkItem(this.title, this.url, this.icon);
}

const links = [
  LinkItem(
      'GitHub', 'https://github.com/h-akatsuki/hitomi_search_plus', Icons.code),
  LinkItem('Discord', 'https://discord.gg/cVNvk6MG', Icons.chat),
];

class CustomDrawerPC extends HookConsumerWidget {
  const CustomDrawerPC({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return FocusTraversalGroup(
      policy: WidgetOrderTraversalPolicy(),
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
            ),
            child: Center(
              child: Text(
                'Hitomi Search Plus',
                style: textTheme.headlineSmall?.copyWith(
                  color: colorScheme.onPrimaryContainer,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildExcludedListTile(
                  context: context,
                  icon: Icons.home,
                  title: 'Home',
                  onTap: () =>
                      Navigator.popUntil(context, (route) => route.isFirst),
                  colorScheme: colorScheme,
                  textTheme: textTheme,
                ),
                _buildExcludedListTile(
                  context: context,
                  icon: Icons.search,
                  title: 'Search',
                  onTap: () => context.push(const SearchScreen()),
                  colorScheme: colorScheme,
                  textTheme: textTheme,
                ),
                _buildExcludedListTile(
                  context: context,
                  icon: Icons.history,
                  title: 'History',
                  onTap: () => context.push(const HistoryScreenPage()),
                  colorScheme: colorScheme,
                  textTheme: textTheme,
                ),
                const Divider(),
                ...links.map((link) => _buildExcludedListTile(
                      context: context,
                      icon: link.icon,
                      title: link.title,
                      onTap: () => openLink(link.url),
                      colorScheme: colorScheme,
                      textTheme: textTheme,
                      iconColor: colorScheme.secondary,
                    )),
                const Divider(),
                _buildExcludedListTile(
                  context: context,
                  icon: Icons.settings,
                  title: 'Settings',
                  onTap: () => context.push(const SettingsScreen()),
                  colorScheme: colorScheme,
                  textTheme: textTheme,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '© 2024 h-akatuki',
              style: textTheme.bodySmall
                  ?.copyWith(color: colorScheme.onSurfaceVariant),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExcludedListTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    required ColorScheme colorScheme,
    required TextTheme textTheme,
    Color? iconColor,
  }) {
    return ExcludeFocus(
      child: ListTile(
        leading: Icon(icon, color: iconColor ?? colorScheme.primary),
        title: Text(title, style: textTheme.titleMedium),
        onTap: onTap,
      ),
    );
  }
}

class CustomDrawer extends HookConsumerWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
            ),
            child: Center(
              child: Text(
                'Hitomi Search Plus',
                style: textTheme.headlineSmall?.copyWith(
                  color: colorScheme.onPrimaryContainer,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.home, color: colorScheme.primary),
                  title: Text('Home', style: textTheme.titleMedium),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.search, color: colorScheme.primary),
                  title: Text('Search', style: textTheme.titleMedium),
                  onTap: () {
                    Navigator.pop(context);
                    context.push(const SearchScreen());
                  },
                ),
                ListTile(
                  leading: Icon(Icons.history, color: colorScheme.primary),
                  title: Text('History', style: textTheme.titleMedium),
                  onTap: () {
                    Navigator.pop(context);
                    context.push(const HistoryScreenPage());
                  },
                ),
                const Divider(),
                ...links.map((link) => ListTile(
                      leading: Icon(link.icon, color: colorScheme.secondary),
                      title: Text(link.title, style: textTheme.titleMedium),
                      onTap: () => openLink(link.url),
                    )),
                const Divider(),
                ListTile(
                  leading: Icon(Icons.settings, color: colorScheme.primary),
                  title: Text('Settings', style: textTheme.titleMedium),
                  onTap: () {
                    Navigator.pop(context);
                    context.push(const SettingsScreen());
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '© 2024 h-akatuki',
              style: textTheme.bodySmall
                  ?.copyWith(color: colorScheme.onSurfaceVariant),
            ),
          ),
        ],
      ),
    );
  }
}
