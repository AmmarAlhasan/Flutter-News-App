import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/news.dart';
import 'home_screen_service.dart';

abstract class HomeScreenController extends GetxController {
  void toggleSearch();

  void resetNewsSearch();

  void newsSearch(String query);
}

class HomeScreenControllerImp extends HomeScreenController {
  late final HomeScreenService service;

  late News news;

  late TextEditingController newsSearchFieldController;

  //late Either<String, ResponseWithModel> result;
  String message = '';

  RxBool isLoading = false.obs;

  RxBool fetchNewsStatus = false.obs;

  RxBool isFiltered = false.obs;

  RxBool isSearchActive = false.obs;

  late dynamic newsList;
  late dynamic filteredNews;

  //late List<dynamic> filteredStudents;

  @override
  void onInit() async {
    super.onInit();
    service = HomeScreenService();

    news = News(
      status: '',
      totalResults: 0,
      articles: [],
    );

    newsSearchFieldController = TextEditingController();

    isLoading.value = true;

    newsList = await service.getAllNews(
      //token: 'Bearer ${myServices.getToken()}',
      token: 'Bearer ',
    );

    print(
        'inOnInit in newsSearchFieldController class, newsList length is : ${newsList.articles.length}');

    for (var article in newsList.articles) {
      print('Article title : ${article.title}');
    }

    filteredNews = newsList;

    print('inOnInit filteredNews length is : ${filteredNews.articles.length}');

    isLoading.value = false;
  }


  @override
  void toggleSearch() {
    print(isSearchActive);
    isSearchActive(!(isSearchActive.value));
  }

  @override
  void resetNewsSearch() {
    isFiltered.value = false;
    filteredNews = newsList;
    print('in resetNewsSearch newsList length is : ${newsList.articles.length}');
    print('in resetNewsSearch filteredNews length is : ${filteredNews.articles.length}');
  }

  @override
  void newsSearch(String query) {
    print('query is:$query');
    if (query.isNotEmpty) {
      filteredNews.articles = newsList.articles.where((article) {
        return article.firstName.toLowerCase().contains(query.toLowerCase()) ||
            article.lastName.toLowerCase().contains(query.toLowerCase());
      }).toList();
      isFiltered.value = true;
    } else {
      isFiltered.value = false;
    }
    print('filteredNews length : ${filteredNews.articles.length}');
    for (var article in filteredNews.articles) {
      print(article.title);
    }
  }
}
