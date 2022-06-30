import 'package:flutter/material.dart';
import 'package:meals_app/components/category_item_card.dart';
import 'package:meals_app/data/dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  static const routeNameCategoryScreen = '/category-screen';
  const CategoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.25,
      ),
      itemCount: DUMMY_CATEGORIES.length,
      itemBuilder: (ctx, index) {
        return CategoryCardItem(renderedCategory: DUMMY_CATEGORIES[index]);
      },
    );
  }
}
