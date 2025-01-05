import 'package:cars/data/dummy_data.dart';
import 'package:cars/models/car.dart';
import 'package:cars/screens/cars.dart';
import 'package:cars/screens/categories.dart';
import 'package:cars/screens/filters.dart';
import 'package:cars/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

const kInitialFilters = {
  Filter.sportMode: false,
  Filter.rearWheelDrive: false,
  Filter.ambientLighting: false,
  Filter.luxuryInterior: false
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  int _selectedPageIndex = 0;
  final List<Car> _favoriteCars = [];
  Map<Filter, bool> _selectedFilters = kInitialFilters;

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
  }

  void _toggleCarFavoriteStatus(Car car) {
    final isExisting = _favoriteCars.contains(car);

    if (isExisting) {
      setState(() {
        _favoriteCars.remove(car);
      });
      _showInfoMessage('Car is no longer a favorite.');
    } else {
      setState(() {
        _favoriteCars.add(car);
      });
      _showInfoMessage('Marked as a favorite!');
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(builder: (ctx) => FiltersScreen(currentFilters: _selectedFilters,))
      );

      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    final availableCars = dummyCars.where((car) {
      if (_selectedFilters[Filter.sportMode]!
        && !car.features.contains(Filter.sportMode)) {
        return false;
      }

      if (_selectedFilters[Filter.rearWheelDrive]!
          && !car.features.contains(Filter.rearWheelDrive)) {
        return false;
      }

      if (_selectedFilters[Filter.ambientLighting]!
          && !car.features.contains(Filter.ambientLighting)) {
        return false;
      }

      if (_selectedFilters[Filter.luxuryInterior]!
          && !car.features.contains(Filter.luxuryInterior)) {
        return false;
      }

      return true;
    }).toList();

    Widget activePage = CategoriesScreen(onToggleFavorite: _toggleCarFavoriteStatus, availableCars: availableCars,);
    String activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = CarsScreen(cars: _favoriteCars, onToggleFavorite: _toggleCarFavoriteStatus,);
      activePageTitle = 'Your favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen,),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          currentIndex: _selectedPageIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
          ]
      ),
    );
  }
}
