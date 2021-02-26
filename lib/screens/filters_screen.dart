import 'package:flutter/material.dart';
import 'package:mealApp/widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = '/filters_sceen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filters'),),
      body: Center(child: Text('Filters')),
      drawer: MainDrawer(),
    );
  }
}