class Car {
  final String id; // Unique identifier
  final List<String> categories; // Categories such as 'toyota', 'SUV', etc.
  final String make; // Aligned with category IDs
  final String model;
  final int year;
  final String color;
  final String image;
  final int price; // Added price field
  final List<String> features; // Features like "Bluetooth", etc.
  final List<String> comments;
  double _mileage;
  bool _isRunning;

  // Constructor
  Car({
    required this.id,
    required this.categories,
    required this.make,
    required this.model,
    required this.year,
    required this.color,
    required this.image,
    required this.price,
    required this.features,
    required this.comments,
  })  : _mileage = 0,
        _isRunning = false {
    // Validation
    if (year < 1886) {
      throw ArgumentError('Invalid year: $year');
    }
    if (price < 0) {
      throw ArgumentError('Price cannot be negative');
    }
  }

  // Getters
  double get mileage => _mileage;
  bool get isRunning => _isRunning;

  // Methods
  void startEngine() {
    if (_isRunning) {
      throw StateError('Engine is already running');
    }
    _isRunning = true;
  }

  void stopEngine() {
    if (!_isRunning) {
      throw StateError('Engine is already stopped');
    }
    _isRunning = false;
  }

  void drive(double distance) {
    if (distance <= 0) {
      throw ArgumentError('Distance must be positive');
    }

    if (!_isRunning) {
      throw StateError('Cannot drive - engine is not running!');
    }

    _mileage += distance;
  }

  // Display features in a readable format
  String displayFeatures() => features.join(', ');
}
