import 'package:flutter/material.dart';

import '../screens/meal_screen.dart';
import '../models/meal.dart';


class MealItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;


  MealItem({
    @required this.id,
    @required this.imageUrl,
    @required this.title,
    @required this.affordability,
    @required this.complexity,
    @required this.duration,
  });

  void selectMeal(BuildContext context){
      Navigator.of(context).pushNamed(MealScreen.routeName, arguments: id);
  }

  String get complexityText {
    switch(this.complexity){
      case Complexity.Simple:
        return "Simple";
      case Complexity.Challenging:
        return "Chellanging";
      case Complexity.Hard:
        return "Hard";
      default:
        return "Unknown";
    }
  }

  String get affordabilityText{
    switch(this.affordability){
      case Affordability.Affordable:
        return "Affordable";
      case Affordability.Pricey:
        return "Pricey";
      case Affordability.Luxurious:
        return "Luxurious";
      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        child: Column(
          children: <Widget>[
            Stack(children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  imageUrl, 
                  height:250, 
                  width: double.infinity, 
                  fit: BoxFit.cover
                ),
              ),
              Positioned(
                bottom: 20,
                right: 10,
                child: Container(
                  color: Colors.black54,
                  width: 250,
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Text(title, 
                    style: TextStyle(
                      color: Colors.white
                    ),                  
                  ),
                ),
              ),
            ],),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [  
                  Row(children: [
                    Icon(Icons.schedule),
                    SizedBox(width: 3),
                    Text('$duration min')
                  ],),
                  Row(children: [
                    Icon(Icons.work),
                    SizedBox(width: 3),
                    Text(complexityText)
                  ],),
                  Row(children: [
                    Icon(Icons.attach_money),
                    SizedBox(width: 3),
                    Text(affordabilityText)
                  ],),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}