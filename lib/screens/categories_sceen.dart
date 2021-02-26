import 'package:flutter/material.dart';

import '../data/categories.dart';
import '../widgets/grid_item.dart';


class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(25.0),
        child: GridView(
          children: DUMMY_CATEGORIES.map((category) => GridItem(id:category.id, title: category.title, color: category.color)).toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        ),
    );
  }
}