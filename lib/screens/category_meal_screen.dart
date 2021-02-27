import 'package:flutter/material.dart';
import 'package:mealApp/models/meal.dart';

import '../data/meals.dart';
import '../widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  List<Meal> _displayedMeals;
  bool isInited = false;
  Map<String, String> routeArgs;
  
  
  void _deleteMeal(String mealID){
    setState(() {
      _displayedMeals.removeWhere((meal) => meal.id==mealID);
    });
  }


  @override
  void didChangeDependencies(){
    if(!isInited){
      routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
      
      _displayedMeals = filteredMeals.where((meal){
        return meal.categories.contains(routeArgs['categoryId']);
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
        appBar: AppBar(title: Text(routeArgs['categoryTitle']), centerTitle: true,),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView.builder(
            itemBuilder: (ctx, index){
              return MealItem(
                id: _displayedMeals[index].id,
                imageUrl: _displayedMeals[index].imageUrl,
                title: _displayedMeals[index].title,
                duration: _displayedMeals[index].duration,
                complexity: _displayedMeals[index].complexity,
                affordability: _displayedMeals[index].affordability,
              );
            },
            itemCount: _displayedMeals.length,
          ),
        ),
    );
  }
}