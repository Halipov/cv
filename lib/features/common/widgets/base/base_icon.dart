import 'package:cv/assets/color/color_scheme.dart';
import 'package:flutter/material.dart';

class BaseIcon extends StatelessWidget {
  final IconData icon;
  const BaseIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      width: 28,
      decoration: BoxDecoration(
        color: AppColorScheme.of(context).primary.withOpacity(0.4),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        size: 18,
      ),
    );
  }
}
