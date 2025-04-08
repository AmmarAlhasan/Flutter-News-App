import 'package:flutter/material.dart';
import '../../helper/config/responsive_config.dart';
import 'border_utils.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({
    super.key,
    required this.controller,
    required this.responsiveConfig,
  });

  final dynamic controller;
  final ResponsiveConfig responsiveConfig;

  @override
  Widget build(BuildContext context) {
    String query = '';

    return Material(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                top: responsiveConfig.verticalSpacing * 0.4,
                bottom: responsiveConfig.verticalSpacing,
              ),
              child: SizedBox(
                width: responsiveConfig.containerWidth,
                height: responsiveConfig.screenHeight * 0.05,
                child: TextField(
                  cursorColor: Colors.blue,
                  style: const TextStyle(color: Colors.white),
                  controller: controller.newsSearchFieldController,
                  decoration: InputDecoration(
                    fillColor: Colors.blue,
                    filled: true,
                    errorBorder:
                        BorderUtils.customBorder(borderColor: Colors.red),
                    enabledBorder:
                        BorderUtils.customBorder(borderColor: Colors.grey),
                    focusedBorder:
                        BorderUtils.customBorder(borderColor: Colors.grey),
                    focusedErrorBorder:
                        BorderUtils.customBorder(borderColor: Colors.red),
                    hintText: 'search',
                    border: const OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: responsiveConfig.horizontalPadding,
                    ),
                    hintStyle: const TextStyle(color: Colors.white),
                  ),
                  onSubmitted: (value) {
                    controller.search(value);
                  },
                  onChanged: (value) {
                    controller.search(value);
                  },
                ),
              ),
            ),
          ),
          Icon(
            Icons.search,
            size: responsiveConfig.iconSize + 2,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
