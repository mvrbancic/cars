
import 'package:cars/models/category.dart';
import 'package:cars/screens/cars.dart';
import 'package:cars/widgets/category_grid_item.dart';
import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/car.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {

    List<Car> filteredCars = dummyCars.where((car) => car.make.toLowerCase() == category.title.toLowerCase()).toList();

   Navigator.push(context, MaterialPageRoute(builder: (ctx) => CarsScreen(
     title: category.title,
     cars: filteredCars,
   )));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3/2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20
      ),
      children: [
        for (final category in carCategories)
          CategoryGridItem(category: category, onSelectCategory: () {
            _selectCategory(context, category);
          },)
      ],
    );
  }
}
