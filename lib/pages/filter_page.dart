import 'package:flutter/material.dart';

bool isGlutenFree = false;
bool isVegan = false;
bool isVegetarian = false;
bool isLactoseFree = false;

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});
  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  Widget filterTile(title, subtitle, value, onChanged) {
    return SwitchListTile(
      activeColor: Theme.of(context).colorScheme.primary,
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filter')),
      body: ListView(
        children: [
          const SizedBox(height: 25),
          Text(
            'Adjust your recipe selection',
            textAlign: TextAlign.center,
            softWrap: true,
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(height: 10),
          filterTile(
            'Gluten-free',
            'Only include gluten-free recipes',
            isGlutenFree,
            (newValue) {
              setState(() {
                isGlutenFree = newValue;
              });
            },
          ),
          filterTile(
            'Vegetarian',
            'Only include vegetarian recipes',
            isVegetarian,
            (newValue) {
              setState(() {
                isVegetarian = newValue;
              });
            },
          ),
          filterTile(
            'Vegan',
            'Only include vegan recipes',
            isVegan,
            (newValue) {
              setState(() {
                isVegan = newValue;
              });
            },
          ),
          filterTile(
            'Lactose-free',
            'Only include lactose-free recipes',
            isLactoseFree,
            (newValue) {
              setState(() {
                isLactoseFree = newValue;
              });
            },
          ),
        ],
      ),
    );
  }
}
