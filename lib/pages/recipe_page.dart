import 'package:flutter/material.dart';
import '../data/category_list.dart';
import '../widgets/recipe_box.dart';
import './filter_page.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({
    super.key,
  });
  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArguments['id'];
    final categoryTitle = routeArguments['title'];
    final recipeListAsCategory = recipeList
        .where((element) => element.categories.contains(categoryId))
        .toList();
    final filteredRecipe = recipeListAsCategory.where((recipe) {
      if (isGlutenFree) {
        if (!recipe.isGlutenFree) return false;
      }
      if (isVegetarian) {
        if (!recipe.isVegetarian) return false;
      }
      if (isVegan) {
        if (!recipe.isVegan) return false;
      }
      if (isLactoseFree) {
        if (!recipe.isLactoseFree) return false;
      }
      return true;
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.tune_rounded,
                  // size: 30,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/filter-page').then((value) {
                    setState(() {});
                  });
                })
          ],
        ),
        body: filteredRecipe.isEmpty
            ? const Center(
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Text(
                    'Sorry! No recipes found in this category ',
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            : ListView.builder(
                itemBuilder: (context, index) => RecipeBox(
                  id: filteredRecipe[index].id,
                  title: filteredRecipe[index].title,
                  imageUrl: filteredRecipe[index].imageUrl,
                  duration: filteredRecipe[index].duration,
                  complexity: filteredRecipe[index].complexity,
                  affordability: filteredRecipe[index].affordability,
                ),
                itemCount: filteredRecipe.length,
              ));
  }
}
