import 'package:flutter/material.dart';

import '../../helper/config/responsive_config.dart';

class CustomField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextStyle? labelStyle;
  final IconData icon;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final ResponsiveConfig responsiveConfig;

  const CustomField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.labelStyle,
    required this.icon,
    required this.textInputType,
    required this.validator,
    required this.onSaved,
    required this.responsiveConfig,
  });

  @override
  Widget build(BuildContext context) {
    double borderWidth = responsiveConfig.screenWidth < 400 ? 1.5 : 2.0;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveConfig.horizontalPadding,
        vertical: responsiveConfig.verticalSpacing,
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: TextFormField(
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: responsiveConfig.screenHeight * 0.02,
            ),
            fillColor: Colors.white,
            filled: true,
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: borderWidth,
              ),
              borderRadius: BorderRadius.circular(
                responsiveConfig.borderRadius,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
                width: borderWidth,
              ),
              borderRadius: BorderRadius.circular(
                responsiveConfig.borderRadius,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blueAccent,
                width: borderWidth,
              ),
              borderRadius: BorderRadius.circular(
                responsiveConfig.borderRadius,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: borderWidth,
              ),
              borderRadius: BorderRadius.circular(
                responsiveConfig.borderRadius,
              ),
            ),
            labelText: labelText,
            labelStyle: labelStyle ??
                TextStyle(
                  fontSize: responsiveConfig.screenWidth < 400 ? 14 : 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600],
                ),
            hintText: hintText,
            prefixIcon: Icon(
              icon,
              size: responsiveConfig.iconSize,
              color: Colors.blueAccent,
            ),
          ),
          keyboardType: textInputType,
          validator: validator,
          onSaved: onSaved,
        ),
      ),
    );
  }
}
