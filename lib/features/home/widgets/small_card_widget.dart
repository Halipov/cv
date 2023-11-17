import 'package:cv/features/common/widgets/base/_base.dart';
import 'package:flutter/material.dart';

class SmallCardWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const SmallCardWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BaseContainer(
        child: Row(
          children: [
            BaseIcon(icon: icon),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  const SizedBox(height: 10),
                  Text(value),
                ],
              ),
            ),
            const Column(
              children: [
                SizedBox(height: 30),
                Text(''),
              ],
            )
          ],
        ),
      ),
    );
  }
}
