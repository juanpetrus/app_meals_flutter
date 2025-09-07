import 'package:flutter/material.dart';

import 'package:meals/components/meal_item.dart'
;
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';

class CategoriesMealsScreen extends StatelessWidget {

  final List<Meal> meals;

  const CategoriesMealsScreen(this.meals);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 5,
              ),
              child: Text(
                'Refeições ${category.title}:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: categoryMeals.length,
                itemBuilder: (ctx, index) {
                  return ListTile(
                    title: MealItem(categoryMeals[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}