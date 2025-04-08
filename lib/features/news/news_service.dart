import 'dart:convert';

import '../../helper/config/api_links.dart';
import '../../model/news.dart';
import 'package:http/http.dart' as http;

class NewsService {
  List<News> newsList = [];

  Future<dynamic> getAllNews({required String token}) async {
    Uri url = Uri.parse(
      ApiLinks.getNewsLink,
    );
    print('getAllNews url in NewsService : $url');

    try {
      http.Response response = await http.get(
        url,
      );
      print(response.statusCode);
      print(response.body);
      var newsList = News.fromJson(json.decode(response.body));

      return newsList;
    } catch (e) {
      print('Caught exception in getAllNews: $e');
      return newsList;
    }
  }
}
