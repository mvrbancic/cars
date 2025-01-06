
import 'package:cars/providers/cars_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter {
  sportMode,
  rearWheelDrive,
  ambientLighting,
  luxuryInterior
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier() : super({
    Filter.sportMode: false,
    Filter.rearWheelDrive: false,
    Filter.ambientLighting: false,
    Filter.luxuryInterior: false
  });

  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive
    };
  }
}

final filtersProvider = StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>((ref) => FiltersNotifier());

final filteredCarsProvider = Provider((ref) {
  final cars = ref.watch(carsProvider);
  final activeFilters = ref.watch(filtersProvider);

  return cars.where((car) {
    if (activeFilters[Filter.sportMode]!
        && !car.features.contains(Filter.sportMode)) {
      return false;
    }

    if (activeFilters[Filter.rearWheelDrive]!
        && !car.features.contains(Filter.rearWheelDrive)) {
      return false;
    }

    if (activeFilters[Filter.ambientLighting]!
        && !car.features.contains(Filter.ambientLighting)) {
      return false;
    }

    if (activeFilters[Filter.luxuryInterior]!
        && !car.features.contains(Filter.luxuryInterior)) {
      return false;
    }

    return true;
  }).toList();
});