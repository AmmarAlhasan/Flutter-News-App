import 'dart:convert';

import '../../model/news.dart';
import 'package:http/http.dart' as http;

class HomeScreenService {
  List<News> newsList = [];

  //late Either<String, ResponseWithModel> result;

  //CreateCycleService({required this.arguments});

  Future<dynamic> getAllNews({required String token}) async {
    Uri url = Uri.parse('https://newsapi.org/v2/everything?q=apple&from=2025-04-05&to=2025-04-05&sortBy=popularity&apiKey=304a3627551546a7a903a011a0b669b3');
    print('getAllNews url in HomeScreenService : $url');

    Map<String, String> headers = {};
   /* headers.addAll({
      'Authorization': token,
    });*/
    try {
      http.Response response = await http.get(
        url,
        headers: headers,
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
