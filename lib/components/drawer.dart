import 'package:flutter/material.dart';
import 'package:meals_app/data/constants.dart';
import 'package:meals_app/screens/filter_screen.dart';

class BuildDrawer extends StatelessWidget {
  const BuildDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.1,
            padding: const EdgeInsets.all(defaultPadding),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondaryVariant,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
          ),
          BuildListTile(
            iconTile: const Icon(Icons.restaurant),
            titleTile: 'Meals',
            selectedOption: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
          ),
          BuildListTile(
            iconTile: const Icon(Icons.settings),
            titleTile: 'Filters',
            selectedOption: () {
              Navigator.of(context)
                  .pushReplacementNamed(FilterScreen.routeName);
            },
          )
        ],
      ),
    );
  }
}

class BuildListTile extends StatelessWidget {
  const BuildListTile({
    Key? key,
    required this.iconTile,
    required this.titleTile,
    required this.selectedOption,
  }) : super(key: key);
  final String titleTile;
  final Icon iconTile;
  final VoidCallback selectedOption;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: iconTile,
      title: Text(
        titleTile,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor),
      ),
      onTap: selectedOption,
    );
  }
}
