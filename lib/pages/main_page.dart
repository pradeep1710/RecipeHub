import 'package:flutter/material.dart';
import 'package:recipe_hub/widgets/drawer.dart';

import 'favourites_page.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Map<String,Object>>  pages = const [
    {'page': MyHomePage(), 'title': 'Recipe Hub'},
    {'page': Favourites(), 'title': 'Favourites'}
  ];
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pages[selectedPage]['title'] as String)),
      drawer: const MainDrawer(),
      body: pages[selectedPage]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // or .shifting
          currentIndex: selectedPage,
          onTap: (value) {
            setState(() {
              selectedPage = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favourites',
            ),
          ]),
    );
  }
}
