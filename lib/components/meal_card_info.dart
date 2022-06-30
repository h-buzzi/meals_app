import 'package:flutter/material.dart';
import 'package:meals_app/components/food_image_with_text.dart';
import 'package:meals_app/data/constants.dart';
import 'package:meals_app/objects/meal.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';

class MealCardInfo extends StatelessWidget {
  const MealCardInfo({
    Key? key,
    required this.selectedMeal,
  }) : super(key: key);

  final Meal selectedMeal;

  void clickMeal(ctx, Meal clickedMeal) {
    Navigator.of(ctx)
        .pushNamed(MealDetailScreen.routeNameMealDetail, arguments: clickedMeal)
        .then((resultMealId) {
      print(resultMealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        clickMeal(context, selectedMeal);
      },
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultPadding)),
        elevation: 4,
        margin: const EdgeInsets.all(defaultPadding / 2),
        child: LayoutBuilder(builder: (ctxx, constraints) {
          return Column(
            children: [
              FoodImageWithText(
                  selectedMeal: selectedMeal,
                  containerWidth: constraints.maxWidth * 0.75),
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.schedule),
                        const SizedBox(width: defaultPadding / 2),
                        Text(
                          '${selectedMeal.duration}',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.work),
                        const SizedBox(width: defaultPadding / 2),
                        Text(selectedMeal.complexityText,
                            style: Theme.of(context).textTheme.caption),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.attach_money),
                        const SizedBox(width: defaultPadding / 2),
                        Text(
                          selectedMeal.affordabilityText,
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
