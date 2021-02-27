import 'package:flutter/material.dart';
import 'package:mealApp/data/meals.dart';
import 'package:mealApp/widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemBuilder: (ctx, index){
            return MealItem(
              id: favoriteMeals[index].id,
              imageUrl: favoriteMeals[index].imageUrl,
              title: favoriteMeals[index].title,
              duration: favoriteMeals[index].duration,
              complexity: favoriteMeals[index].complexity,
              affordability: favoriteMeals[index].affordability,
            );
          },
          itemCount: favoriteMeals.length,
        ),
      );
  }
}