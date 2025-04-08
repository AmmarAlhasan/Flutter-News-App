import 'package:flutter/material.dart';

import '../../helper/config/responsive_config.dart';
import '../../model/news.dart';
import 'custom_bottom_sheet.dart';
import 'news_card.dart';

class CustomSearchDelegate extends SearchDelegate {
  final List<Article> articles;
  final ResponsiveConfig responsiveConfig;

  CustomSearchDelegate({
    required this.articles,
    required this.responsiveConfig,
  });

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<dynamic> filteredNews = [];
    print('query is:$query');
    filteredNews = articles.where((article) {
      return article.title.toLowerCase().contains(query.toLowerCase()) ||
          article.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    print('filteredNews length : ${filteredNews.length}');
    for (var article in filteredNews) {
      print(article.title);
    }
    return ListView.builder(
      itemCount: filteredNews.length,
      itemBuilder: (context, index) {
        final article = filteredNews[index];
        return NewsCard(
          article: article,
          onTap: () {
            print('Tapped: ${article.title}');
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return CustomBottomSheet(
                    article: article,
                    responsiveConfig: responsiveConfig,
                  );
                });
          },
          responsiveConfig: responsiveConfig,
        );
      },
    );
    //isFiltered.value = true;
    //isFiltered.value = false;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SizedBox();
  }
}
