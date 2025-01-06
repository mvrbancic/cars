import 'package:cars/screens/car_details.dart';
import 'package:cars/widgets/car_item.dart';
import 'package:flutter/material.dart';

import '../models/car.dart';

class CarsScreen extends StatelessWidget {
  const CarsScreen({
    super.key,
    this.title,
    required this.cars
  });

  final String? title;
  final List<Car> cars;

  void selectCar(BuildContext ctx, Car car) {
      Navigator.of(ctx).push(MaterialPageRoute(builder: (ctx) => CarDetailsScreen(car: car)));
  }

  @override
  Widget build(BuildContext context) {

    Widget content = ListView.builder(
        itemCount: cars.length,
        itemBuilder: (ctx, index) => CarItem(car: cars[index], onSelectCar: (car) { selectCar(context, car);},)
    );

    if (cars.isEmpty) {
      content = Center(child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Uh oh ... nothing here!",
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground),
          ),
          SizedBox(height: 16,),
          Text("Try selecting a diffrent category!",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground),
          )
        ],
      ),);
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
