import 'package:flutter/material.dart';
import '../widgets/drawer.dart';
import '../data/category_list.dart';
import '../widgets/category_box.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Recipe Hub')),
      drawer: const MainDrawer(),
      body: GridView(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2.5,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15),
        children: categoryList
            .map((each) =>
                CategoryBox(id: each.id, title: each.title, color: each.color))
            .toList(),
      ),
    );
  }
}
