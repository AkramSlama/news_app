import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import '../Services/news-services.dart';
import 'news-list-view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.category});
final String category ;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}
var future ;
class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   future = NewService(Dio()).getTopHeadlinesNews(category:widget.category) ;

  }

  @override

  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>
      (
        future:   future  ,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsListView(
              articles: snapshot.data!,
            );
          } else if (snapshot.hasError) {
            return const SliverToBoxAdapter(
              child: Center(child: Text(' Oops there are error ,  try later ')),
            );
          } else {
            return const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
//  return isLoading
//    ? const SliverToBoxAdapter(
//     child: Center(child: CircularProgressIndicator()))
//: articles.isNotEmpty
//  ? NewsListView(
//    articles: articles,)
//: const SliverToBoxAdapter(
//    child:
// Center(child: Text(' Oops there are error ,  try later ')),
// );
//}
