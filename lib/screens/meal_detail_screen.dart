import 'package:flutter/material.dart';
import 'package:meals_app/data/constants.dart';
import 'package:meals_app/objects/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeNameMealDetail = '/meal-detail';
  final Function favorite;
  final Function isFavorite;
  const MealDetailScreen(
      {required this.isFavorite, required this.favorite, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Meal _clickedMeal =
        ModalRoute.of(context)!.settings.arguments as Meal;
    final Size _deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(_clickedMeal.title),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        actions: [
          IconButton(
            icon: Icon(
                isFavorite(_clickedMeal.id) ? Icons.star : Icons.star_border),
            color: Theme.of(context).colorScheme.secondaryVariant,
            onPressed: () {
              favorite(_clickedMeal.id);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _deviceSize.height * 0.35,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
              child: Image.network(_clickedMeal.imageUrl),
            ),
            const BuildSectionTitle(
              sectionTitle: 'Ingredients',
            ),
            SectionContainer(
                deviceSize: _deviceSize,
                sectionChild: IngredientsList(
                    clickedMealSection: _clickedMeal.ingredients)),
            const BuildSectionTitle(sectionTitle: 'Steps'),
            SectionContainer(
              deviceSize: _deviceSize,
              sectionChild: StepsList(clickedMealSteps: _clickedMeal.steps),
            ),
          ],
        ),
      ),
      floatingActionButton: IconButton(
        icon:
            Icon(isFavorite(_clickedMeal.id) ? Icons.star : Icons.star_border),
        color: Theme.of(context).primaryColor,
        onPressed: () {
          favorite(_clickedMeal.id);
        },
      ),
    );
  }
}

class StepsList extends StatelessWidget {
  const StepsList({
    Key? key,
    required this.clickedMealSteps,
  }) : super(key: key);

  final List<String> clickedMealSteps;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: clickedMealSteps.length,
      itemBuilder: (ctx, index) {
        return Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                child: Text(
                  '# ${index + 1}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: Colors.white),
                ),
              ),
              title: Text(
                clickedMealSteps[index],
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            const Divider(),
          ],
        );
      },
    );
  }
}

class SectionContainer extends StatelessWidget {
  const SectionContainer({
    Key? key,
    required Size deviceSize,
    required this.sectionChild,
  })  : _deviceSize = deviceSize,
        super(key: key);

  final Size _deviceSize;
  final Widget sectionChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Theme.of(context).colorScheme.secondary),
          borderRadius:
              BorderRadius.all(const Radius.circular(defaultPadding) / 2)),
      margin: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
      height: _deviceSize.height * 0.23,
      width: _deviceSize.width * 0.9,
      child: sectionChild,
    );
  }
}

class IngredientsList extends StatelessWidget {
  const IngredientsList({
    Key? key,
    required List<String> clickedMealSection,
  })  : _clickedMealSection = clickedMealSection,
        super(key: key);

  final List<String> _clickedMealSection;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _clickedMealSection.length,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.all(defaultPadding / 8),
            child: Text(
              '- ${_clickedMealSection[index]}',
              style: Theme.of(context).textTheme.bodyText2,
            ),
          );
        });
  }
}

class BuildSectionTitle extends StatelessWidget {
  const BuildSectionTitle({
    Key? key,
    required this.sectionTitle,
  }) : super(key: key);

  final String sectionTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
      child: Text(
        sectionTitle,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
