import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key});
  static const ScreenName = 'detail-meal';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
    ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final id = routeArgs['id'];
    return Scaffold(
      appBar: AppBar(title: Text(id!),),
      body: Column(children: [
        Text('data'),
        Text('data'),
        Text('data'),
      ],)
    );
  }
}
