import 'package:cars/widgets/car_item_trait.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/car.dart';

class CarItem extends StatelessWidget {
  const CarItem({super.key, required this.car, required this.onSelectCar});

  final Car car;
  final void Function(Car car) onSelectCar;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          onSelectCar(car);
        },
        child: Stack(
          children: [
            FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(car.image),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                  child: Column(
                    children: [
                      Text(car.model,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        )
                      ),
                      const SizedBox(height: 12,),
                      Row(
                        children: [
                          CarItemTrait(icon: Icons.calendar_month, label: '${car.year}'),
                          SizedBox(width: 12,),
                          CarItemTrait(icon: Icons.money, label: '${car.price} eura')
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
