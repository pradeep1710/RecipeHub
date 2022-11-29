import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: double.infinity,
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
              color: Theme.of(context).appBarTheme.backgroundColor,
              ),
            child: const ListTile(
                title: Text(
                  'Recipe Hub',
                  style: TextStyle(fontSize: 35),
                ),
                minVerticalPadding: 20),
          ),
          ListTile(
            leading: const Icon(Icons.restaurant),
            title: const Text('Home'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.filter_alt),
            title: const Text('Filter'),
            onTap: () {
              Navigator.of(context).pushNamed('/filter-page');
            },
          )
        ],
      ),
    );
  }
}
