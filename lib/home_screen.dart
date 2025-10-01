import 'package:flutter/material.dart';
import 'details_screen.dart';

class Recipe {
  final String name;
  final List<String> ingredients;
  final String instructions;

  Recipe({
    required this.name,
    required this.ingredients,
    required this.instructions,
  });
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static final List<Recipe> recipes = [
    Recipe(
      name: 'Chocolate Chip Cookies',
      ingredients: [
        '2 cups all-purpose flour',
        '1 cup butter, softened',
        '3/4 cup brown sugar',
        '1/2 cup white sugar',
        '2 large eggs',
        '2 tsp vanilla extract',
        '1 tsp baking soda',
        '1 tsp salt',
        '2 cups chocolate chips'
      ],
      instructions: '1. Preheat oven to 375°F.\n2. Mix butter and sugars until creamy.\n3. Beat in eggs and vanilla.\n4. Combine flour, baking soda, and salt; gradually add to mixture.\n5. Stir in chocolate chips.\n6. Drop onto ungreased cookie sheets.\n7. Bake 9-11 minutes until golden brown.',
    ),
    Recipe(
      name: 'Chicken Curry',
      ingredients: [
        '1 lb chicken breast, cubed',
        '1 onion, diced',
        '3 cloves garlic, minced',
        '1 tbsp curry powder',
        '1 can coconut milk',
        '1 can diced tomatoes',
        '2 tbsp olive oil',
        'Salt and pepper to taste',
        'Fresh cilantro'
      ],
      instructions: '1. Heat oil in a large pan.\n2. Cook chicken until browned.\n3. Add onion and garlic, cook until soft.\n4. Add curry powder and cook for 1 minute.\n5. Add tomatoes and coconut milk.\n6. Simmer for 20 minutes until chicken is cooked through.\n7. Season with salt and pepper.\n8. Garnish with cilantro.',
    ),
    Recipe(
      name: 'Caesar Salad',
      ingredients: [
        '1 head romaine lettuce',
        '1/2 cup parmesan cheese, grated',
        '1/4 cup caesar dressing',
        '1 cup croutons',
        '2 tbsp lemon juice',
        'Black pepper to taste'
      ],
      instructions: '1. Wash and chop romaine lettuce.\n2. Place lettuce in a large bowl.\n3. Add caesar dressing and toss.\n4. Add lemon juice and mix.\n5. Top with parmesan cheese and croutons.\n6. Season with black pepper and serve immediately.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorite Recipes'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12.0),
            child: ListTile(
              leading: const Icon(Icons.restaurant_menu, size: 40),
              title: Text(
                recipe.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('${recipe.ingredients.length} ingredients'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(recipe: recipe),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}