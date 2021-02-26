import 'package:flutter/material.dart';
import '../screens/category_meal_screen.dart';

class GridItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  const GridItem({
    @required this.id,
    @required this.title, 
    @required this.color,
  });
  
  void _selectCategory(BuildContext context){
    Navigator.of(context).pushNamed(
      CategoryMealScreen.routeName, 
      arguments: {
        'categoryId':this.id,
        'categoryTitle':this.title,
      }, 
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => _selectCategory(context),
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
        child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title, style: Theme.of(context).textTheme.subtitle1,),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}