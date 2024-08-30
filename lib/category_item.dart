import 'package:flutter/material.dart';
import 'package:meals/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(this.title, this.color, this.id);

  final String id;
  final String title;
  final Color color;

  void categorySelected(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.screenName,
        arguments: {'id': id, 'title': title, 'color': color});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: () => categorySelected(context),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color.withOpacity(0.8), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
