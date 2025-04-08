import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../helper/config/responsive_config.dart';
import '../../widgets/common/custom_bottom_sheet.dart';
import '../../widgets/common/custom_search_delegate.dart';
import '../../widgets/common/news_card.dart';
import 'news_controller.dart';

class NewsScreen extends StatelessWidget {
  static const String routeName = '/User_Home_Screen';

  NewsScreen({super.key});

  final NewsControllerImp controller = Get.put(NewsControllerImp());

  @override
  Widget build(BuildContext context) {
    final responsiveConfig = ResponsiveConfig(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text(
          'News',
        ),
        actions: [
          IconButton(
            onPressed: () {
              print("Search button pressed");
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(
                  articles: controller.newsList.articles,
                  responsiveConfig: responsiveConfig,
                ),
              );
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            tooltip: 'Search',
          ),
        ],
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(color: Colors.blueAccent),
              )
            : Padding(
                padding: EdgeInsets.all(responsiveConfig.horizontalPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Latest News',
                      style: TextStyle(
                        fontSize: responsiveConfig.screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: responsiveConfig.verticalSpacing),
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.newsList.articles.length,
                        itemBuilder: (context, index) {
                          final article = controller.newsList.articles[index];
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
                                },
                              );
                            },
                            responsiveConfig: responsiveConfig,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
