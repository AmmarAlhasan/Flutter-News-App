import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../helper/config/responsive_config.dart';
import '../../model/news.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
    required this.article,
    required this.responsiveConfig,
  });

  final Article article;
  final ResponsiveConfig responsiveConfig;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        responsiveConfig.screenWidth * 0.03,
      ),
      child: SingleChildScrollView(
        child: Card(
          margin: EdgeInsets.all(
            responsiveConfig.screenWidth * 0.05,
          ),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              responsiveConfig.borderRadius,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(
              responsiveConfig.screenWidth * 0.04,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (article.urlToImage != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      responsiveConfig.borderRadius,
                    ),
                    child: Image.network(
                      article.urlToImage!,
                      height: responsiveConfig.screenHeight * 0.25,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                SizedBox(
                  height: responsiveConfig.screenHeight * 0.02,
                ),
                Text(
                  article.title,
                  style: TextStyle(
                    fontSize: responsiveConfig.screenWidth < 400 ? 16 : 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: responsiveConfig.screenHeight * 0.01,
                ),
                Row(
                  children: [
                    Icon(Icons.person,
                        size: responsiveConfig.iconSize,
                        color: Colors.grey.shade700),
                    SizedBox(
                      width: responsiveConfig.screenWidth * 0.01,
                    ),
                    Text(
                      article.author ?? 'Unknown Author',
                    ),
                  ],
                ),
                SizedBox(
                  height: responsiveConfig.screenHeight * 0.01,
                ),
                Row(
                  children: [
                    Icon(Icons.calendar_today,
                        size: responsiveConfig.iconSize,
                        color: Colors.grey.shade700),
                    SizedBox(
                      width: responsiveConfig.screenWidth * 0.01,
                    ),
                    Text(
                      article.publishedAt.split('T').first,
                    ),
                  ],
                ),
                SizedBox(
                  height: responsiveConfig.screenHeight * 0.02,
                ),
                Text(
                  article.description ?? "No description available.",
                  style: TextStyle(
                    fontSize: responsiveConfig.screenWidth < 400 ? 12 : 14,
                  ),
                ),
                SizedBox(
                  height: responsiveConfig.screenHeight * 0.01,
                ),
                Text(
                  article.content ?? "No full content available.",
                  style: TextStyle(
                    fontSize: responsiveConfig.screenWidth < 400 ? 12 : 13,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(
                  height: responsiveConfig.screenHeight * 0.02,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      await launchUrl(
                        Uri.parse(article.url),
                      );
                    },
                    icon: const Icon(
                      Icons.open_in_browser,
                      color: Colors.white,
                    ),
                    label: const Text(
                      "Read Full Article",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(
                        vertical: responsiveConfig.screenHeight * 0.015,
                        horizontal: responsiveConfig.screenWidth * 0.04,
                      ),
                    ),
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
