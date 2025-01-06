

import 'package:cars/models/car.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteCarsNotifier extends StateNotifier<List<Car>> {
  FavoriteCarsNotifier() : super([]);

  bool toggleCarFavoriteStatus(Car car) {
    final carIsFavorite = state.contains(car);

    if (carIsFavorite) {
      state = state.where((c) => c.id != car.id).toList();
      return false;
    } else {
      state = [...state, car];
      return true;
    }
  }
}

final favoriteCarsProvider = StateNotifierProvider<FavoriteCarsNotifier, List<Car>>((ref) {
  return FavoriteCarsNotifier();
});