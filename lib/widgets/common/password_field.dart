import 'package:flutter/material.dart';

import '../../helper/config/responsive_config.dart';

class PasswordField extends StatelessWidget {
  final IconData icon;
  final bool isVisible;
  final String hintText;
  final String labelText;
  final bool passwordVisible;
  final TextStyle? labelStyle;
  final IconButton suffixIcon;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final ResponsiveConfig responsiveConfig;

  const PasswordField({
    super.key,
    required this.isVisible,
    required this.passwordVisible,
    required this.labelText,
    required this.hintText,
    this.labelStyle,
    required this.icon,
    required this.suffixIcon,
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
        vertical: responsiveConfig.verticalSpacing * 0.75,
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: TextFormField(
          decoration: InputDecoration(
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
              borderRadius:
                  BorderRadius.circular(responsiveConfig.borderRadius),
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
            prefixIcon: Icon(
              icon,
              size: responsiveConfig.iconSize,
              color: Colors.blueAccent,
            ),
            labelText: labelText,
            labelStyle: labelStyle ??
                TextStyle(
                  fontSize: responsiveConfig.buttonFontSize,
                ),
            suffixIcon: Visibility(
              visible: isVisible,
              child: suffixIcon,
            ),
          ),
          keyboardType: textInputType,
          obscureText: !passwordVisible,
          validator: validator,
          onSaved: onSaved,
        ),
      ),
    );
  }
}
