import 'package:flutter/material.dart';
import 'package:mealApp/data/meals.dart';
import 'package:mealApp/models/meal.dart';

class MealScreen extends StatefulWidget {
  static const routeName = '/meal-detail';

  @override
  _MealScreenState createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  
  Meal _meal;
  bool _isFavorated;
  bool _isInited=false;

  Widget _buildHeading({@required TextStyle textStyle, @required String text}){
    return Container(
      margin: EdgeInsets.all(20),
      child: Text(text, style: textStyle,),
    );
  }


  void _manageFavoriteness(Meal meal){
    if(!_isFavorated){
      favoriteMeals.add(meal);
    }
    else{
      favoriteMeals.removeWhere((favMeal)=> favMeal.id==meal.id);
    }

    setState((){
      _isFavorated = !_isFavorated;
    });
  }

  Widget _buildCustomContainer({@required Widget childWidget}){
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 200,
      width: 300,
      child: childWidget,
    );
  }

  @override
  void didChangeDependencies(){
    if(!_isInited){
      final mealID = ModalRoute.of(context).settings.arguments;
      _meal = filteredMeals.firstWhere((meal) => meal.id==mealID); 
      _isFavorated = favoriteMeals.firstWhere((meal) => meal.id==_meal.id, orElse: () => null)!=null;
      _isInited=true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('The Meal'), centerTitle: true,),
      body: SingleChildScrollView(
          child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                _meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _buildHeading(
              textStyle: Theme.of(context).textTheme.subtitle1, 
              text: 'Ingredients'
            ),
            _buildCustomContainer(
              childWidget: ListView.builder(itemBuilder: (ctx, index){
                return Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical:5, horizontal:10),
                    child: Text(_meal.ingredients[index]),
                  ),
                );
              }, 
              itemCount: _meal.ingredients.length,
              ),
            ),
            _buildHeading(
              textStyle: Theme.of(context).textTheme.subtitle1, 
              text: 'Steps'
            ),
            _buildCustomContainer(
              childWidget: ListView.builder(itemBuilder: (ctx, index){
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index+1}'),
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      title: Text(_meal.steps[index], style: Theme.of(context).textTheme.bodyText1),
                    ),
                    if(index+1 < _meal.steps.length)
                      Divider(),
                  ],
                );
              }, 
              itemCount: _meal.steps.length,
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: _isFavorated ? Icon(Icons.star) : Icon(Icons.star_border),
        onPressed: () => _manageFavoriteness(_meal),
      ),
    );
  }
}