import 'package:flutter/material.dart';
import 'package:meals/category_meals_screen.dart';
import 'package:meals/meals_screen.dart';
import './categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
          canvasColor: Colors.purple,
          fontFamily: 'Raleway',
          textTheme: const TextTheme(
            bodySmall: TextStyle(
                color: Colors.white,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.w400,
                fontSize: 14),
            bodyMedium: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold ,
                fontSize: 16),
            titleLarge: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w300),

          )),
      home: const CategoriesScreen(),
      routes: {
        CategoryMealsScreen.screenName : (ctx) => CategoryMealsScreen(),
        MealsScreen.ScreenName : (ctx) => MealsScreen(),

      },
    );
  }
}
