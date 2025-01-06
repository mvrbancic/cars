
import 'package:cars/data/dummy_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final carsProvider = Provider((ref) {
  return dummyCars;
});