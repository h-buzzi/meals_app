import 'package:flutter/material.dart';
import 'package:meals_app/data/constants.dart';
import 'package:meals_app/objects/meal.dart';

class FoodImageWithText extends StatelessWidget {
  const FoodImageWithText(
      {Key? key, required this.selectedMeal, required this.containerWidth})
      : super(key: key);

  final Meal selectedMeal;
  final double containerWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(defaultPadding),
              topRight: Radius.circular(defaultPadding)),
          child: Image.network(
            selectedMeal.imageUrl,
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: defaultPadding / 2,
          right: defaultPadding / 2,
          child: Container(
            width: containerWidth,
            margin: const EdgeInsets.all(defaultPadding),
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding / 2, vertical: defaultPadding / 2),
            color: Colors.black54,
            child: Text(
              selectedMeal.title,
              style: const TextStyle(fontSize: 26, color: Colors.white),
              softWrap: true,
              overflow: TextOverflow.fade,
            ),
          ),
        ),
      ],
    );
  }
}
