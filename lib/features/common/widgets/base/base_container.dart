import 'package:cv/assets/color/color_scheme.dart';
import 'package:flutter/material.dart';

class BaseContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final Color? color;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  const BaseContainer({
    super.key,
    required this.child,
    this.color,
    this.height,
    this.width,
    this.margin,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppColorScheme.of(context);
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding ?? const EdgeInsets.all(11),
      decoration: BoxDecoration(
        color: color ?? theme.secondary.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }
}
