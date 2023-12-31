import 'package:flutter/material.dart';
import 'package:news_app/Widgets/news-list-view-builder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key,  required this.category}) : super(key: key);
final String category ;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomScrollView(
        slivers: [
          NewsListViewBuilder(category:category)
        ],
      ),
    );
  }
}
