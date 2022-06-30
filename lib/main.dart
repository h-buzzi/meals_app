import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/objects/meal.dart';
import 'package:meals_app/screens/category_meal_list_screen.dart';
import 'package:meals_app/screens/category_screen.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeal = DUMMY_MEALS;

  List<Meal> _favoriteMeals = [];

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false
  };

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeal = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          appBarTheme: AppBarTheme(foregroundColor: Colors.pink[50]),
          primarySwatch: Colors.brown,
          colorScheme: ThemeData().colorScheme.copyWith(
              secondary: Colors.brown[600],
              secondaryVariant: Colors.orange[200]),
          canvasColor: Colors.pink[50],
          fontFamily: 'RaleWay',
          textTheme: TextTheme(
              bodyText1: TextStyle(
                  color: Colors.pink[50],
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoCondensed'),
              bodyText2: const TextStyle(
                  color: Colors.brown,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RaleWay'),
              caption: const TextStyle(color: Colors.grey),
              headline6: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[600]))),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(favoriteMeals: _favoriteMeals),
        CategoryScreen.routeNameCategoryScreen: (ctx) => const CategoryScreen(),
        CategoryMealScreen.routeNameCategoryMealScreen: (ctx) =>
            CategoryMealScreen(_availableMeal),
        MealDetailScreen.routeNameMealDetail: (ctx) => MealDetailScreen(
              favorite: _toggleFavorite,
              isFavorite: _isMealFavorite,
            ),
        FilterScreen.routeName: (ctx) => FilterScreen(
              saveFilters: _setFilters,
              currentFilters: _filters,
            ),
      },
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   return MaterialPageRoute(builder: (ctx) => CategoryMealScreen());
      // },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => const CategoryScreen());
      },
    );
  }
}
