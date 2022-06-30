import 'package:flutter/material.dart';
import 'package:meals_app/components/meal_card_info.dart';
import 'package:meals_app/objects/category_object.dart';
import 'package:meals_app/objects/meal.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeNameCategoryMealScreen = '/categories-meals';

  final List<Meal> availableMeals;

  CategoryMealScreen(this.availableMeals);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, Category>;
    final Category? _selectedCategory = routeArgs['selected_category'];
    final categoryMeals = availableMeals.where((meal) {
      return meal.categories.contains(_selectedCategory!.id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedCategory!.title),
        backgroundColor: _selectedCategory.color,
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          return MealCardInfo(selectedMeal: categoryMeals[index]);
        },
      ),
    );
  }
}
