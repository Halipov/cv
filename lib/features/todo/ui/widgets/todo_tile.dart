import 'package:cv/features/common/widgets/base/_base.dart';
import 'package:cv/features/todo/domain/model/_model.dart';
import 'package:cv/features/todo/ui/widgets/_widgets.dart';
import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    super.key,
    required this.item,
    required this.onChanged,
    required this.onDismissed,
  });

  final Todo item;
  final void Function(bool) onChanged;
  final void Function(DismissDirection) onDismissed;

  @override
  Widget build(BuildContext context) => Dismissible(
        key: ValueKey(item),
        background: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.delete),
          ],
        ),
        onDismissed: onDismissed,
        child: BaseContainer(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      item.description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              StreamCheckBox(
                initialValue: item.isDone,
                onChanged: onChanged,
              ),
            ],
          ),
        ),
      );
}
