import 'package:flutter/material.dart';
import '../data/category_list.dart';
import '../widgets/recipe_box.dart';

class Favourites extends StatefulWidget {
  const Favourites({super.key});

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  updateCache() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final favouriteRecipeupdated = favouriteRecipe;
    return Scaffold(
        // appBar: AppBar(title: const Text('Favourites')),

        body: favouriteRecipeupdated.isEmpty
            ? const Center(
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Text(
                    'your favourite recipes will save here',
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            : ListView.builder(
                itemBuilder: (context, index) => RecipeBox(
                  id: favouriteRecipeupdated[index].id,
                  title: favouriteRecipeupdated[index].title,
                  imageUrl: favouriteRecipeupdated[index].imageUrl,
                  duration: favouriteRecipeupdated[index].duration,
                  complexity: favouriteRecipeupdated[index].complexity,
                  affordability: favouriteRecipeupdated[index].affordability,
                  updateCache: updateCache,
                ),
                itemCount: favouriteRecipeupdated.length,
              ));
  }
}
