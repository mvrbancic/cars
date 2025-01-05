import 'package:cars/models/car.dart';
import 'package:cars/screens/cars.dart';
import 'package:cars/screens/categories.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  int _selectedPageIndex = 0;
  final List<Car> _favoriteCars = [];

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

  @override
  Widget build(BuildContext context) {

    Widget activePage = CategoriesScreen(onToggleFavorite: _toggleCarFavoriteStatus);
    String activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = CarsScreen(cars: _favoriteCars, onToggleFavorite: _toggleCarFavoriteStatus,);
      activePageTitle = 'Your favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
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
