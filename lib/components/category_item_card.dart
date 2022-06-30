import 'package:flutter/material.dart';
import 'package:meals_app/data/constants.dart';
import 'package:meals_app/objects/category_object.dart';
import 'package:meals_app/screens/category_meal_list_screen.dart';

class CategoryCardItem extends StatelessWidget {
  const CategoryCardItem({Key? key, required this.renderedCategory})
      : super(key: key);

  final Category renderedCategory;

  void selectCategory(ctx, Category _selectedCategory) {
    Navigator.of(ctx).pushNamed(CategoryMealScreen.routeNameCategoryMealScreen,
        arguments: {'selected_category': _selectedCategory});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          selectCategory(context, renderedCategory);
        },
        splashColor: renderedCategory.color,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Center(
            child: Text(
          renderedCategory.title,
          style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: 16),
        )),
      ),
      //padding: const EdgeInsets.all(defaultPadding),
      margin: const EdgeInsets.all(defaultPadding * 0.75),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(colors: [
            renderedCategory.color,
            renderedCategory.color.withOpacity(0.35)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
    );
  }
}
