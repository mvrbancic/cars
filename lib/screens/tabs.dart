import 'package:cars/data/dummy_data.dart';
import 'package:cars/providers/favorites_provider.dart';
import 'package:cars/providers/filters_provider.dart';
import 'package:cars/screens/cars.dart';
import 'package:cars/screens/categories.dart';
import 'package:cars/screens/filters.dart';
import 'package:cars/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const kInitialFilters = {
  Filter.sportMode: false,
  Filter.rearWheelDrive: false,
  Filter.ambientLighting: false,
  Filter.luxuryInterior: false
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => FiltersScreen())
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableCars = ref.watch(filteredCarsProvider);

    Widget activePage = CategoriesScreen(availableCars: availableCars,);
    String activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      final favoriteCars = ref.watch(favoriteCarsProvider);
      activePage = CarsScreen(cars: favoriteCars);
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
