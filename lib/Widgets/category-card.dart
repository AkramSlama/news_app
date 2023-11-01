import 'package:flutter/material.dart';
import 'package:news_app/models/category-model.dart';
import 'package:news_app/views/category-view.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, required this.category}) : super(key: key);
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return  CategoryView(
                category:category.categoryName
            );
          }),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 14),
        child: Container(
          width: 170,
          height: 120,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(category.image),
              ),
              borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: Text(
              category.categoryName,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
