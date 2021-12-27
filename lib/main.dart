import 'package:flutter/material.dart';
import 'package:food_app_flutter/screens/category_meal_screen.dart';
import 'package:food_app_flutter/screens/category_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foods Category',
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      //home: CategoryScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => CategoryScreen(),
        CategoryMealScreen.routeName: (context) => CategoryMealScreen(),
      },
    );
  }
}
