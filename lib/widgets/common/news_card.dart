import 'package:flutter/material.dart';
import '../../helper/config/responsive_config.dart';
import '../../model/news.dart';

class NewsCard extends StatelessWidget {
  final Article article;
  final VoidCallback onTap;
  final ResponsiveConfig responsiveConfig;

  const NewsCard({
    super.key,
    required this.article,
    required this.onTap,
    required this.responsiveConfig,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(responsiveConfig.borderRadius),
      ),
      margin: EdgeInsets.symmetric(
          vertical: responsiveConfig.verticalSpacing * 0.5),
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(responsiveConfig.horizontalPadding),
          child: Row(
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(responsiveConfig.borderRadius * 0.75),
                child: Image.network(
                  article.urlToImage ?? '',
                  height: responsiveConfig.screenHeight * 0.1,
                  width: responsiveConfig.screenWidth * 0.25,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Icon(
                      Icons.broken_image,
                      size: responsiveConfig.iconSize * 2.5),
                ),
              ),
              SizedBox(width: responsiveConfig.horizontalPadding * 0.5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.source.name,
                      style: TextStyle(
                        fontSize: responsiveConfig.buttonFontSize * 0.7,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: responsiveConfig.verticalSpacing * 0.25),
                    Text(
                      article.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: responsiveConfig.buttonFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: responsiveConfig.verticalSpacing * 0.25),
                    Text(
                      article.description ?? 'No description available',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: responsiveConfig.buttonFontSize * 0.85,
                      ),
                    ),
                    SizedBox(height: responsiveConfig.verticalSpacing * 0.25),
                    Text(
                      article.publishedAt.split('T').first,
                      style: TextStyle(
                        fontSize: responsiveConfig.buttonFontSize * 0.7,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
