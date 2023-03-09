import 'package:flutter/material.dart';
import 'package:recipe/views/widgets/recipe_card.dart';
import 'package:recipe/models/recipe.api.dart';
import '../models/recipe.dart';

class Home extends StatefulWidget {
  const Home({super.key});


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 10),
            Text('Secret Recipes')
          ],
        ),
      ),
      body:  _isLoading ? const Center(child: CircularProgressIndicator())
      : ListView.builder(
        itemCount: _recipes.length,
          itemBuilder: (context,index){
           return RecipeCard(
              title: _recipes[index].name,
              rating: _recipes[index].rating.toString(),
              cookTime: _recipes[index].totalTime,
              thumbnailUrl: _recipes[index].images);
          }
          )

    );
  }
}
