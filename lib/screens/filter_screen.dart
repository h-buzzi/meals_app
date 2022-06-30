import 'package:flutter/material.dart';
import 'package:meals_app/components/drawer.dart';
import 'package:meals_app/data/constants.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filtersScreen';

  final Function saveFilters;
  final Map<String, bool> currentFilters;
  const FilterScreen(
      {required this.saveFilters, required this.currentFilters, Key? key})
      : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian
                };
                widget.saveFilters(selectedFilters);
                Navigator.of(context).pushReplacementNamed('/');
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: const BuildDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(defaultPadding),
            child: Text(
              'Adjust you meal selection!',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  title: Text(
                    'Gluten Free',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  value: _glutenFree,
                  subtitle: const Text('Only include gluten-free meals'),
                  onChanged: (newValue) {
                    setState(
                      () {
                        _glutenFree = newValue;
                      },
                    );
                  },
                ),
                SwitchListTile(
                  title: Text(
                    'Lactose Free',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  value: _lactoseFree,
                  subtitle: const Text('Only include lactose-free meals'),
                  onChanged: (newValue) {
                    setState(
                      () {
                        _lactoseFree = newValue;
                      },
                    );
                  },
                ),
                SwitchListTile(
                  title: Text(
                    'Vegetarian',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  value: _vegetarian,
                  subtitle: const Text('Only include vegetarian meals'),
                  onChanged: (newValue) {
                    setState(
                      () {
                        _vegetarian = newValue;
                      },
                    );
                  },
                ),
                SwitchListTile(
                  title: Text(
                    'Vegan',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  value: _vegan,
                  subtitle: const Text('Only include vegan meals'),
                  onChanged: (newValue) {
                    setState(
                      () {
                        _vegan = newValue;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
