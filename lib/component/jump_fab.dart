import 'package:flutter/material.dart';
import 'package:hitomi_search_plus/tools/suger.dart';

class PageJumpWidget extends StatelessWidget {
  final int initialIndex;
  final Stream<int> pageStream;
  final int total;
  final Function(int) onJump;

  const PageJumpWidget({
    super.key,
    required this.initialIndex,
    required this.pageStream,
    required this.total,
    required this.onJump,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: pageStream,
      initialData: initialIndex,
      builder: (context, snapshot) {
        final currentPage = snapshot.data ?? initialIndex;
        return GestureDetector(
          onTap: () => _showJumpDialog(context, currentPage),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: context.theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: context.theme.colorScheme.primary.withOpacity(0.5),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              '${currentPage + 1} / $total',
              style: TextStyle(
                color: context.theme.colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        );
      },
    );
  }

  void _showJumpDialog(BuildContext context, int currentPage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        int selectedPage = currentPage;
        return AlertDialog(
          backgroundColor: context.theme.colorScheme.secondaryContainer,
          title: const Text('Jump to item'),
          content: Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Item number'),
                  onChanged: (value) {
                    selectedPage = int.tryParse(value) ?? currentPage;
                  },
                ),
              ),
              Text('/ $total'),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Jump'),
              onPressed: () {
                if (selectedPage > 0 && selectedPage <= total) {
                  onJump(selectedPage);
                  Navigator.of(context).pop();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Invalid item number')),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}
