import 'package:cars/providers/filters_provider.dart';
import 'package:cars/screens/tabs.dart';
import 'package:cars/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      body: Column(
          children: [
            SwitchListTile(
                value: activeFilters[Filter.sportMode]!,
                onChanged: (isChecked) {
                  ref.read(filtersProvider.notifier).setFilter(Filter.sportMode, isChecked);
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
              value: activeFilters[Filter.rearWheelDrive]!,
              onChanged: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(Filter.rearWheelDrive, isChecked);
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
              value: activeFilters[Filter.ambientLighting]!,
              onChanged: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(Filter.ambientLighting, isChecked);
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
              value: activeFilters[Filter.luxuryInterior]!,
              onChanged: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(Filter.luxuryInterior, isChecked);
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
    );
  }
}
