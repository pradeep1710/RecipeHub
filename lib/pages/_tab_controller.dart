import 'package:flutter/material.dart';
import 'favourites_page.dart';
import './home_page.dart';

// this file is not used in this project, only for implementing tabs 

class TabScreen extends StatelessWidget {
  const TabScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Recipe Hub'),
              bottom: const TabBar(tabs: [
                Tab(text: 'Categories',),
                Tab(text: 'Favourites'),
              ]),
            ),
            body: const TabBarView(children: [
              MyHomePage(),
              Favourites(),
            ])));
  }
}
