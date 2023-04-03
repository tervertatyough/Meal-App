import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';

import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/categories_meal_screen.dart';
// import './screens/categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'glutten': false,
    'lactose': false,
    'vegan': false,
    'vegeterian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['glutten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['vegeterian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "Raleway",
          textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: const TextStyle(
                  fontSize: 18,
                  fontFamily: "RobotoCondensed",
                  fontWeight: FontWeight.bold))),
      // home: const CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => const TabsScreen(),
        CategoriesMealsScreen.routeName: (ctx) =>
            CategoriesMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => const MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
    );
  }
}
