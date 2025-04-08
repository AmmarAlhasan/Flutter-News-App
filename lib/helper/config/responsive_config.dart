import 'package:flutter/material.dart';

class ResponsiveConfig {
  final BuildContext context;
  late final double screenWidth;
  late final double screenHeight;

  ResponsiveConfig(this.context) {
    final mediaQuery = MediaQuery.of(context);
    screenWidth = mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;
  }

  double get verticalSpacing => screenHeight * 0.02;

  double get horizontalPadding => screenWidth * 0.04;

  double get containerWidth => screenWidth < 600 ? screenWidth * 0.9 : 400.0;

  double get buttonFontSize => screenWidth < 400 ? 16 : 18;

  double get iconSize => screenWidth < 400 ? 20 : 24;

  double get borderRadius => screenWidth < 400 ? 20.0 : 30.0;

}
