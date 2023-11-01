import 'package:dio/dio.dart';
import '../models/article.dart';

class NewService {
  final Dio dio; //attribute

  NewService(this.dio); //constructor

  Future<List<ArticleModel>> getTopHeadlinesNews({required String category}) async {

    try {
      var response = await dio.get(
          'https://newsapi.org/v2/top-headlines?apiKey=bff3c0ddbdf540559fea543e1c6df4cf&country=us&category=$category');
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];

      List<ArticleModel> articlesList = [];
      for (var article in articles) {
        articlesList.add(ArticleModel.fromJson(article));
      }
      return articlesList;
    } on Exception {
      return [] ;
    }

  } //function
}
