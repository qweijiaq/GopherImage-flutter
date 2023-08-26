import 'package:flutter/material.dart';

class AppTextMenuItem extends StatelessWidget {
  final String label;
  final GestureTapCallback? onTap;
  final bool isActive;

  AppTextMenuItem({
    required this.label,
    this.onTap,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    Color? color;
    FontWeight fontWeight = FontWeight.normal;

    if (isActive) {
      color = Theme.of(context).textTheme.bodySmall!.color;
      fontWeight = FontWeight.bold;
    }
    return Container(
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: color,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
