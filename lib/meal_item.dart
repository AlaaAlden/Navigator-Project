import 'package:flutter/material.dart';
import 'package:meals/meals_screen.dart';
import '/models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;
  final Color color;

  const MealItem(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.duration,
      required this.complexity,
      required this.affordability,
      required this.color,
      required this.id});

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
    }
  }

  void mealSelect(BuildContext context) {
    Navigator.of(context).pushNamed(MealsScreen.ScreenName, arguments: {'id' : id});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        mealSelect(context);
      },
      child: Card(
        color: color.withOpacity(0.9),
        margin: const EdgeInsets.all(20),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  left: 0,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    color: color.withOpacity(0.4),
                    width: 300,
                    child: Center(
                      child: Text(
                        title,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule_rounded, color: Colors.white),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '$duration min',
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work, color: Colors.white),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(complexityText,
                          style: Theme.of(context).textTheme.bodySmall)
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.wallet,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(affordabilityText,
                          style: Theme.of(context).textTheme.bodySmall)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
