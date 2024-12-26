import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/dock_viewmodel.dart';
import '../widget/dock_item_widget.dart';

class DockView extends StatelessWidget {
  const DockView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<DockViewModel>(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.black12,
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int index = 0; index < viewModel.items.length; index++)
            DragTarget<IconData>(
              onAccept: (draggedIcon) {
                viewModel.reorder(draggedIcon, index);
              },
              builder: (context, candidateData, rejectedData) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: DockItemWidget(
                    key: ValueKey(viewModel.items[index]),
                    icon: viewModel.items[index],
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
