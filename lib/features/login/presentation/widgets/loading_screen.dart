import 'package:flutter/material.dart';

import '../../../../core/theme/theme_color.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    this.size = 1,
    this.color = ThemeColor.brandBackground,
    Key? key,
  }) : super(key: key);

  final double size;

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: size,
      ),
    );
  }
}
