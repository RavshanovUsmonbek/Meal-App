import 'package:flutter/material.dart';
import 'package:mealApp/screens/category_meal_screen.dart';
import 'package:mealApp/screens/filters_screen.dart';

import 'screens/meal_screen.dart';
import 'screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          bodyText2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          subtitle1: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // home: CategoriesScreen(),
      // initialRoute: CategoriesScreen.routeName,
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryMealScreen.routeName : (ctx) => CategoryMealScreen(),
        MealScreen.routeName : (ctx) => MealScreen(),
        FiltersScreen.routeName : (ctx) => FiltersScreen(),
      },
    );
  }
}

