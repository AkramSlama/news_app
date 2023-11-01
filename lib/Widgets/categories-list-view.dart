import 'package:flutter/material.dart';
import '../models/category-model.dart';
import 'category-card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({Key? key}) : super(key: key);
  final List<CategoryModel> categories = const [
    CategoryModel(image: 'assets/arsenal.jpeg', categoryName: 'Sports'),
    CategoryModel(
        image: 'assets/entertaiment.avif', categoryName: 'Entertainment'),
    CategoryModel(image: 'assets/general.avif', categoryName: 'General'),
    CategoryModel(image: 'assets/health.avif', categoryName: 'Health'),
    CategoryModel(image: 'assets/science.avif', categoryName: 'Science'),
    CategoryModel(image: 'assets/technology.jpeg', categoryName: 'Technology'),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryCard(
              category: categories[index],
            );
          }),
    );
  }
}
