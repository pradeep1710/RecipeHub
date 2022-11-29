import 'package:flutter/material.dart';
import '../models/recipe_base_class.dart';

class RecipeBox extends StatefulWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final void Function()? updateCache;

  const RecipeBox({
    super.key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
    this.updateCache,
  });

  @override
  State<RecipeBox> createState() => _RecipeBoxState();
}

class _RecipeBoxState extends State<RecipeBox> {
  String get complexityAsString {
    switch (widget.complexity) {
      case Complexity.simple:
        return 'Simple';
      case Complexity.medium:
        return 'Medium';
      case Complexity.hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityAsString {
    switch (widget.affordability) {
      case Affordability.affordable:
        return 'Affordable';
      case Affordability.costly:
        return 'Costly';
      case Affordability.expensive:
        return 'Expensive';
      default:
        return 'Unknown';
    }
  }

  void selectedRecipe(context) {
    Navigator.of(context)
        .pushNamed('/recipe-detail-page', arguments: widget.id)
        .then((value) {
      widget.updateCache!();
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedRecipe(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    widget.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                    width: double.infinity,
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.transparent, Colors.black54],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                    ),
                    child: Text(
                      widget.title,
                      softWrap: true,
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: Colors.white),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(children: [
                    const Icon(Icons.timer_outlined),
                    const SizedBox(width: 2),
                    Text('${widget.duration} min')
                  ]),
                  Row(children: [
                    const Icon(Icons.work_outline_outlined),
                    const SizedBox(width: 2),
                    Text(complexityAsString)
                  ]),
                  Row(children: [
                    const Icon(Icons.currency_rupee_rounded),
                    Text(affordabilityAsString)
                  ])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
