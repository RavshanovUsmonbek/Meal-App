import 'package:flutter/material.dart';

import '../data/meals.dart';
import '../widgets/meal_item.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    
    final categoryMeals = DUMMY_MEALS.where((meal){
      return meal.categories.contains(routeArgs['categoryId']);
    }).toList();
    
    return Scaffold(
        appBar: AppBar(title: Text(routeArgs['categoryTitle']), centerTitle: true,),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView.builder(
            itemBuilder: (ctx, index){
              return MealItem(
                id: categoryMeals[index].id,
                imageUrl: categoryMeals[index].imageUrl,
                title: categoryMeals[index].title,
                duration: categoryMeals[index].duration,
                complexity: categoryMeals[index].complexity,
                affordability: categoryMeals[index].affordability,
              );
            },
            itemCount: categoryMeals.length,
          ),
        ),
    );
  }
}