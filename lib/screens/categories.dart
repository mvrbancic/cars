
import 'package:cars/models/category.dart';
import 'package:cars/screens/cars.dart';
import 'package:cars/widgets/category_grid_item.dart';
import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/car.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableCars});

  final List<Car> availableCars;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> with SingleTickerProviderStateMixin {
  
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 300),
        lowerBound: 0,
        upperBound: 1
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {

    List<Car> filteredCars = widget.availableCars.where((car) => car.make.toLowerCase() == category.title.toLowerCase()).toList();

   Navigator.push(context, MaterialPageRoute(builder: (ctx) => CarsScreen(
     title: category.title,
     cars: filteredCars,
   )));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
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
      ),
      // builder: (context, child) => Padding(
      //     padding: EdgeInsets.only(
      //       top: 100 - _animationController.value * 100
      //     ),
      //   child: child,
      // ),
      // builder: (context, child) => SlideTransition(
      //     position: _animationController.drive(
      //       Tween(
      //         begin: Offset(0, 0.3),
      //         end: Offset(0, 0)
      //       )
      //     ),
      //   child: child,
      // ),
      builder: (context, child) => SlideTransition(
        position: Tween(
            begin: Offset(0, 0.3),
            end: Offset(0, 0)
        ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut)),
        child: child,
      ),
    );
  }
}
