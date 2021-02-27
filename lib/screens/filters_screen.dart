import 'package:flutter/material.dart';
import 'package:mealApp/data/filters.dart';
import 'package:mealApp/data/meals.dart';
import 'package:mealApp/models/meal.dart';
import 'package:mealApp/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters_sceen';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  void filterMeals(newValue, filterType){
    switch(filterType){
      case 'vegan': 
        setState((){
          isVegan = newValue;
        });
        break;
      case 'vegaterian':
        setState((){
          isVegetarian = newValue;
        }); 
        break;
      case 'luctose-free': 
        setState((){
          isLactoseFree = newValue;
        });
        break;
      case 'gluten-free': 
        setState((){
          isGlutenFree = newValue;
        });
        break;
    }
    filteredMeals = new List<Meal>.from(DUMMY_MEALS);

    filteredMeals = DUMMY_MEALS.where((meal) {
      bool result=true;

      result = isGlutenFree ? (isGlutenFree==meal.isGlutenFree) : result;
      result = isVegan ? (isVegan==meal.isVegan) : result;
      result = isVegetarian ? (isVegetarian==meal.isVegetarian) : result;
      result = isLactoseFree ? (isLactoseFree==meal.isLactoseFree) : result;

      return result;
    }).toList();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filters'),),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Text(
              'Change your meal selection',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
              child: ListView(
                children: [
                  SwitchListTile(
                    title: Text('Glutten-Free'),
                    value: isGlutenFree,
                    subtitle: Text('Include only gluten-free meals'),
                    onChanged: (newValue) => filterMeals(newValue, 'gluten-free'),
                  ),
                  SwitchListTile(
                    title: Text('Vegan'),
                    value: isVegan,
                    subtitle: Text('Include only vegan meals'),
                    onChanged: (newValue) => filterMeals(newValue, 'vegan'),
                  ),
                  SwitchListTile(
                    title: Text('Lactose-Free'),
                    value: isLactoseFree,
                    subtitle: Text('Include only lactose-free meals'),
                    onChanged: (newValue) => filterMeals(newValue, 'luctose-free'),
                  ),
                  SwitchListTile(
                    title: Text('Vegaterian'),
                    value: isVegetarian,
                    subtitle: Text('Include only vegaterian meals'),
                    onChanged: (newValue) => filterMeals(newValue, 'vegaterian'),
                  ),
                ],
              ),
          ),
        ],
      ),
    );
  }
}