
import 'package:flutter/material.dart';
import '../data/category_list.dart';

class RecipeDetail extends StatefulWidget {
  const RecipeDetail({super.key});

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  @override
  Widget build(BuildContext context) {
    int stepIndex = 0;
    String recipeId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedRecipe =
        recipeList.firstWhere((recipe) => recipe.id == recipeId);

    final existingIndex =
        favouriteRecipe.indexWhere((recipe) => recipe.id == recipeId);

    toggleFavourite() {
      setState(() {
        existingIndex < 0
            ? favouriteRecipe
                .add(recipeList.firstWhere((recipe) => recipe.id == recipeId))
            : favouriteRecipe.removeAt(existingIndex);
      });
    }

    return Scaffold(
      appBar: AppBar(title: Text(selectedRecipe.title)),
      body: ListView(
        children: [
          SizedBox(
            height: 280,
            child: Image.network(
              selectedRecipe.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ingredients',
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 4),
                // return list of ingredients
                ...selectedRecipe.ingredients
                    .map((each) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(children: [
                            Icon(
                              Icons.circle,
                              color: Theme.of(context).colorScheme.primary,
                              size: 10,
                            ),
                            const SizedBox(width: 5),
                            Text(each)
                          ]),
                        ))
                    .toList(),
                const SizedBox(height: 10),
                Text(
                  'Steps',
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 4),
                // return list of steps
                ...selectedRecipe.steps.map((
                  each,
                ) {
                  stepIndex++;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      CircleAvatar(
                        foregroundColor: Colors.black,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        child: Text(
                          stepIndex.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Flexible(
                        child: Text(
                          each,
                        ),
                      )
                    ]),
                  );
                }).toList(),

                const SizedBox(height: 50)
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleFavourite,
        child: existingIndex < 0
            ? const Icon(Icons.star_border,size: 35,)
            : const Icon(Icons.star,size: 35,),
      ),
    );
  }
}
