import 'package:flutter/material.dart';
import 'custom_icons.dart';

class IconContainer extends StatelessWidget {
  final IconData? icon;
  final Color color;
  final double size;
  final bool isACIcon;
  final bool isSwimmingPoolIcon;

  const IconContainer({
    super.key,
    this.icon,
    required this.color,
    this.size = 48.0,
    this.isACIcon = false,
    this.isSwimmingPoolIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget iconWidget;
    
    if (isACIcon) {
      iconWidget = CustomIcons.buildACIcon(Colors.white);
    } else if (isSwimmingPoolIcon) {
      iconWidget = CustomIcons.buildSwimmingPoolIcon(Colors.white);
    } else if (icon != null) {
      iconWidget = Icon(icon, color: Colors.white, size: 24);
    } else {
      iconWidget = const SizedBox();
    }

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(child: iconWidget),
    );
  }
}

