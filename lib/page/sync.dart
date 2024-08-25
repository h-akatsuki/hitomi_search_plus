import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hitomi_search_plus/db/export.dart';
import 'package:hitomi_search_plus/server/user.dart';
import 'package:hitomi_search_plus/tools/suger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DataSyncScreen extends HookConsumerWidget {
  const DataSyncScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uuid = ref.watch(userUUIDProvider);
    final status = ref.watch(dataSyncStateProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Sync'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 600),
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sync Instructions',
                  style: theme.textTheme.headlineSmall,
                ),
                const SizedBox(height: 16),
                Text(
                  '1. On the source device, tap "Upload" to sync your data.\n'
                  '2. Copy the User ID below.\n'
                  '3. On the target device, paste the User ID and tap "Download".',
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(height: 32),
                Text(
                  'User ID',
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                if (uuid.value == null)
                  const Center(child: CircularProgressIndicator())
                else
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: theme.colorScheme.outline),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Clipboard.setData(ClipboardData(text: uuid.value!));
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Copied to clipboard')),
                              );
                            },
                            child: Text(
                              uuid.value!,
                              style: theme.textTheme.bodyLarge,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            _showUUIDEditDialog(context, ref, uuid.value!);
                          },
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 48),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SyncButton(
                      icon: Icons.upload,
                      label: 'Upload',
                      status: status.upload,
                      onPressed: () {
                        ref.read(dataSyncProvider.notifier).uploadData();
                      },
                    ),
                    SyncButton(
                      icon: Icons.download,
                      label: 'Download',
                      status: status.download,
                      onPressed: () {
                        ref.read(dataSyncProvider.notifier).downloadData();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showUUIDEditDialog(
      BuildContext context, WidgetRef ref, String currentUUID) {
    final controller = TextEditingController(text: currentUUID);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit UUID'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Enter new UUID',
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                final newUUID = controller.text.trim();
                if (_isValidUUID(newUUID)) {
                  ref.read(userUUIDProvider.notifier).set(newUUID);
                  Navigator.of(context).pop();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Invalid UUID format')),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  bool _isValidUUID(String uuid) {
    final uuidRegex = RegExp(
      r'^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$',
      caseSensitive: false,
    );
    return uuidRegex.hasMatch(uuid);
  }
}

class SyncButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final SyncState status;
  final VoidCallback onPressed;

  const SyncButton({
    super.key,
    required this.icon,
    required this.label,
    required this.status,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        ElevatedButton(
          onPressed: status == SyncState.working ? null : onPressed,
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
            backgroundColor: _getColor(context),
          ),
          child: Icon(icon, size: 30, color: theme.colorScheme.onPrimary),
        ),
        const SizedBox(height: 8),
        Text(label, style: theme.textTheme.titleMedium),
        const SizedBox(height: 4),
        Text(_getStatusText(), style: theme.textTheme.bodySmall),
      ],
    );
  }

  Color _getColor(BuildContext context) {
    switch (status) {
      case SyncState.none:
        return context.theme.colorScheme.secondary;
      case SyncState.working:
        return context.theme.colorScheme.primary;
      case SyncState.error:
        return context.theme.colorScheme.error;
    }
  }

  String _getStatusText() {
    switch (status) {
      case SyncState.none:
        return 'Idle';
      case SyncState.working:
        return 'Working';
      case SyncState.error:
        return 'Error';
    }
  }
}