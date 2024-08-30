import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';
import 'package:meals/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const screenName = 'Category-Meals';

  //CategoryMealsScreen(this.id, this.title, this.color);
  //final String id;
  //final String title;
  //final Color color;
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    final id = routeArgs['id'];
    final title = routeArgs['title'] as String;
    final color = routeArgs['color'] as Color;
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(id);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          backgroundColor: color,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              imageUrl: categoryMeals[index].imageUrl,
              title: categoryMeals[index].title,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability,
              color: color,
              id: id.toString(),
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
