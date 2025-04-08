import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/config/responsive_config.dart';

class CustomRegistrationButton extends StatelessWidget {
  final String text;
  final String destination;
  final IconData? icon;
  final ResponsiveConfig responsiveConfig;

  const CustomRegistrationButton({
    super.key,
    required this.text,
    required this.destination,
    required this.responsiveConfig,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: responsiveConfig.containerWidth,
      height: responsiveConfig.screenHeight * 0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          responsiveConfig.borderRadius,
        ),
        gradient: const LinearGradient(
          colors: [Colors.blueAccent, Colors.blueAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              responsiveConfig.borderRadius,
            ),
          ),
        ),
        onPressed: () {
          Get.toNamed(destination);
        },
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              responsiveConfig.borderRadius,
            ),
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(
                    icon,
                    color: Colors.white,
                    size: responsiveConfig.iconSize,
                  ),
                  const SizedBox(width: 8),
                ],
                Text(
                  text,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: responsiveConfig.buttonFontSize,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
