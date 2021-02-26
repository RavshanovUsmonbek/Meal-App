import 'package:flutter/material.dart';
import 'package:mealApp/data/meals.dart';

class MealScreen extends StatelessWidget {
  static const routeName = '/meal-detail';


  Widget _buildHeading({@required TextStyle textStyle, @required String text}){
    return Container(
      margin: EdgeInsets.all(20),
      child: Text(text, style: textStyle,),
    );
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
  Widget build(BuildContext context) {
    final mealID = ModalRoute.of(context).settings.arguments;
    final meal = DUMMY_MEALS.firstWhere((meal) => meal.id==mealID); 

    return Scaffold(
      appBar: AppBar(title: Text('The Meal'), centerTitle: true,),
      body: SingleChildScrollView(
          child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                meal.imageUrl,
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
                    child: Text(meal.ingredients[index]),
                  ),
                );
              }, 
              itemCount: meal.ingredients.length,
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
                      title: Text(meal.steps[index], style: Theme.of(context).textTheme.bodyText1),
                    ),
                    if(index+1 < meal.steps.length)
                      Divider(),
                  ],
                );
              }, 
              itemCount: meal.steps.length,
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      )
    );
  }
}