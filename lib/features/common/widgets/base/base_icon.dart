import 'package:flutter/material.dart';

class BaseIcon extends StatelessWidget {
  final IconData icon;
  const BaseIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      width: 28,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        size: 18,
      ),
    );
  }
}
