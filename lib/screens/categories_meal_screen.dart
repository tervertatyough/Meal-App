import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoriesMealsScreen extends StatefulWidget {
  final List<Meal> availableMeals;

  static const routeName = "/categories";

  const CategoriesMealsScreen(this.availableMeals, {super.key});

  @override
  State<CategoriesMealsScreen> createState() => _CategoriesMealsScreenState();
}

class _CategoriesMealsScreenState extends State<CategoriesMealsScreen> {
  late String categoryTitle;
  late List<Meal> displayedMeals;

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    categoryTitle = routeArgs["title"] as String;
    final categoryId = routeArgs["id"] as String;
    displayedMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  // final String categoryId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
            id: displayedMeals[index].id,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
