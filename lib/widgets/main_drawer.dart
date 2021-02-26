import 'package:flutter/material.dart';
import 'package:mealApp/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  
  Widget _buildListTile(String text, IconData icon, Function handler){
    return ListTile(
      leading: Icon(icon, size:26),
      title: Text(
        text,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
      onTap: handler,
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 150,
            width: double.infinity,
            padding: EdgeInsets.all(25),
            color: Theme.of(context).accentColor,
            alignment: Alignment.center,
            child: Text(
              'Coocking Up', 
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w900,
                fontSize: 32,
              ),
            ),
          ),
          _buildListTile(
            'Meals', 
            Icons.restaurant, 
            () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          _buildListTile(
            'Filters', 
            Icons.settings,
            () => Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName),
          ),
        ]
      )
    );
  }
}