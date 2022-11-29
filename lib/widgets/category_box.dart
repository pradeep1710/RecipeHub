import 'package:flutter/material.dart';

class CategoryBox extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const CategoryBox({
    super.key,
    required this.title,
    required this.color,
    required this.id,
  });

  void selectcategory(BuildContext context) {
    Navigator.of(context).pushNamed('/recipe-page', arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        selectcategory(context);
      },
      child: Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [color.withOpacity(0.6), color],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline5,
          )),
    );
  }
}
