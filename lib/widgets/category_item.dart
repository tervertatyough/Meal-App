import 'package:flutter/material.dart';

import '../screens/categories_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const CategoryItem({
    super.key,
    required this.title,
    required this.color,
    required this.id,
  });

  void selectCategory(ctx) {
    Navigator.of(ctx).pushNamed(CategoriesMealsScreen.routeName, arguments: {
      "id": id,
      "title": title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          style: Theme.of(context).textTheme.titleMedium,
          title,
        ),
      ),
    );
  }
}
