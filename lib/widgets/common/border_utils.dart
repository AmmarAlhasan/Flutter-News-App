import 'package:flutter/material.dart';

class BorderUtils {
  static OutlineInputBorder customBorder({
    required Color borderColor,
    double borderWidth = 2.0,
    BorderRadius borderRadius = const BorderRadius.all(
      Radius.circular(30.0),
    ),
  }) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor,
        width: borderWidth,
      ),
      borderRadius: borderRadius,
    );
  }
}
