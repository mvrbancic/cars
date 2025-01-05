import 'package:cars/screens/tabs.dart';
import 'package:cars/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

enum Filter {
  sportMode,
  rearWheelDrive,
  ambientLighting,
  luxuryInterior
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  bool _sportModeFilterSet = false;
  bool _rearWheelDriveFilterSet = false;
  bool _ambientLightingFilterSet = false;
  bool _luxuryInteriorFilterSet = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _sportModeFilterSet = widget.currentFilters[Filter.sportMode]!;
    _rearWheelDriveFilterSet = widget.currentFilters[Filter.rearWheelDrive]!;
    _ambientLightingFilterSet = widget.currentFilters[Filter.ambientLighting]!;
    _luxuryInteriorFilterSet = widget.currentFilters[Filter.luxuryInterior]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      // drawer: MainDrawer(onSelectScreen: (identifier) {
      //   Navigator.of(context).pop();
      //   if (identifier == 'cars') {
      //     Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(builder: (ctx) => TabsScreen())
      //     );
      //   }
      // }),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          if(didPop) return;
          Navigator.of(context).pop({
            Filter.sportMode: _sportModeFilterSet,
            Filter.rearWheelDrive: _rearWheelDriveFilterSet,
            Filter.ambientLighting: _ambientLightingFilterSet,
            Filter.luxuryInterior: _luxuryInteriorFilterSet,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
                value: _sportModeFilterSet,
                onChanged: (isChecked) {
                  setState(() {
                    _sportModeFilterSet = isChecked;
                  });
                },
                title: Text('Sport Mode',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground
                  ),
                ),
                subtitle: Text('Only include sport mode',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground
                  ),
                ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _rearWheelDriveFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _rearWheelDriveFilterSet = isChecked;
                });
              },
              title: Text('Rear-Wheel Drive',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground
                ),
              ),
              subtitle: Text('Only include rear wheel drive',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _ambientLightingFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _ambientLightingFilterSet = isChecked;
                });
              },
              title: Text('Ambient Lighting',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground
                ),
              ),
              subtitle: Text('Only include ambient lighting',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _luxuryInteriorFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _luxuryInteriorFilterSet = isChecked;
                });
              },
              title: Text('Luxury Interior',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground
                ),
              ),
              subtitle: Text('Only include luxury interior',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            )
          ],
        ),
      ),
    );
  }
}
