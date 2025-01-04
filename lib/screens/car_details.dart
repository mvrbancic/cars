import 'package:flutter/material.dart';

import '../models/car.dart';

class CarDetailsScreen extends StatelessWidget {
  const CarDetailsScreen({super.key, required this.car});

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(car.model),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
                car.image,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover
            ),
            SizedBox(height: 14,),
            Text('Details',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 14,),
            for (final feature in car.features)
              Text(feature,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)
              ),
            SizedBox(height: 14,),
            Text('Categories',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 14,),
            for (final category in car.categories)
              Text(category,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground)
              ),
            SizedBox(height: 14,),
            Text('Comments',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 14,),
            for (final comment in car.comments)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(comment,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground)
                ),
              ),
          ],
        ),
      ),
    );
  }
}
