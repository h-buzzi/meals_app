import 'package:flutter/material.dart';
import 'package:meals_app/components/meal_card_info.dart';
import 'package:meals_app/objects/meal.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favorites;
  const FavoritesScreen({required this.favorites, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favorites.isEmpty) {
      return const Center(
          child: Text('You have no favorites yet - start adding some!'));
    } else {
      return ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (ctx, index) {
          return MealCardInfo(selectedMeal: favorites[index]);
        },
      );
    }
  }
}
