import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double size;
  final Color? color;
  final String variation;

  AppLogo({
    this.size = 32,
    this.color,
    this.variation = '',
  });

  @override
  Widget build(BuildContext context) {
    Color _color;

    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    if (color == null) {
      _color = isDarkMode ? Colors.grey : Colors.black;
    } else {
      _color = color!;
    }

    String image = 'assets/images/logo.png';

    if (variation.isNotEmpty) {
      image = 'assets/images/logo-$variation.png';
    }

    return Image.asset(
      image,
      width: size,
      color: _color,
    );
  }
}
