import 'package:flutter/material.dart';
import 'recipe.dart';

final _recipes = [
  Recipe(
      title: 'Spaghetti Carbonara',
      description: 'A classic Italian pasta dish with creamy sauce.',
      instruction:
          '1. Cook pasta according to package instructions.\n2. In a skillet, cook bacon until crispy. Remove excess fat.\n3. In a bowl, whisk together eggs, cheese, and black pepper.\n4. Drain pasta and add to skillet with bacon. Pour egg mixture over pasta and toss until coated.\n5. Serve immediately with extra cheese on top.',
      ingredients: [
        '8 oz spaghetti',
        '4 slices bacon',
        '2 eggs',
        '1/2 cup grated Parmesan cheese',
        '1/2 tsp black pepper'
      ],
      image: Image.asset('assets/images/dishes/SpaghettiCarbonara.jpg')),
  Recipe(
      title: 'Chicken Stir-Fry',
      description:
          'A quick and easy Asian-inspired dish with vegetables and chicken.',
      instruction:
          '1. Heat oil in a large skillet or wok over medium-high heat.\n2. Add diced chicken breast and cook until browned.\n3. Add sliced bell peppers, broccoli florets, and sliced carrots. Cook until vegetables are tender.\n4. In a small bowl, mix soy sauce, garlic, ginger, and cornstarch. Pour over chicken and vegetables.\n5. Cook until sauce thickens and everything is heated through.\n6. Serve hot over rice or noodles.',
      ingredients: [
        '1 lb chicken breast, diced',
        '1 bell pepper, sliced',
        '1 cup broccoli florets',
        '1 carrot, sliced',
        '2 cloves garlic, minced',
        '1 tsp grated ginger',
        '1/4 cup soy sauce',
        '1 tbsp cornstarch'
      ],
      image: Image.asset('assets/images/dishes/ChickenStir-Fry.jpg')),
  Recipe(
      title: 'Caesar Salad',
      description:
          'A classic salad with crisp romaine lettuce, croutons, and Caesar dressing.',
      instruction:
          '1. Wash and chop romaine lettuce.\n2. In a large bowl, toss lettuce with Caesar dressing until evenly coated.\n3. Top with croutons and grated Parmesan cheese.\n4. Serve immediately as a side dish or add grilled chicken for a main course.',
      ingredients: [
        '1 head romaine lettuce',
        '1/2 cup Caesar dressing',
        '1 cup croutons',
        '1/4 cup grated Parmesan cheese'
      ],
      image: Image.asset('assets/images/dishes/CaesarSalad.jpg')),
  Recipe(
      title: 'Chocolate Chip Cookies',
      description: 'Classic homemade cookies with gooey chocolate chips.',
      instruction:
          '1. Preheat oven to 350°F (175°C). Line baking sheets with parchment paper.\n2. In a large bowl, cream together butter, sugar, and brown sugar until smooth.\n3. Beat in eggs one at a time, then stir in vanilla.\n4. In another bowl, combine flour, baking soda, and salt. Gradually add to butter mixture.\n5. Stir in chocolate chips.\n6. Drop by rounded spoonfuls onto prepared baking sheets.\n7. Bake for 10 to 12 minutes or until edges are golden brown.\n8. Allow cookies to cool on baking sheet for 5 minutes before transferring to a wire rack to cool completely.',
      ingredients: [
        '1 cup butter, softened',
        '3/4 cup granulated sugar',
        '3/4 cup packed brown sugar',
        '2 eggs',
        '1 tsp vanilla extract',
        '2 1/4 cups all-purpose flour',
        '1 tsp baking soda',
        '1/2 tsp salt',
        '2 cups semisweet chocolate chips'
      ],
      image: Image.asset('assets/images/dishes/ChocolateChipCookies.jpg')),
  Recipe(
      title: 'Vegetable Curry',
      description:
          'A flavorful and hearty vegetarian curry with mixed vegetables and spices.',
      instruction:
          '1. Heat oil in a large pot over medium heat. Add diced onion and cook until translucent.\n2. Stir in minced garlic, grated ginger, and curry powder. Cook for 1 minute.\n3. Add chopped vegetables (such as potatoes, carrots, bell peppers, and cauliflower) and cook until slightly softened.\n4. Pour in coconut milk and vegetable broth. Bring to a simmer and cook until vegetables are tender.\n5. Season with salt and pepper to taste.\n6. Serve hot over rice or with naan bread.',
      ingredients: [
        '1 onion, diced',
        '2 cloves garlic, minced',
        '1 tbsp grated ginger',
        '2 tbsp curry powder',
        'Assorted vegetables (potatoes, carrots, bell peppers, cauliflower)',
        '1 can coconut milk',
        '1 cup vegetable broth',
        'Salt and pepper to taste'
      ],
      image: Image.asset('assets/images/dishes/VegetableCurry.jpg')),
  Recipe(
      title: 'Margherita Pizza',
      description:
          'A classic Italian pizza with simple ingredients and fresh flavors.',
      instruction:
          '1. Preheat oven to 500°F (260°C). Place a pizza stone in the oven to heat.\n2. Roll out pizza dough on a floured surface into a circle.\n3. Spread pizza sauce over the dough, leaving a border around the edges.\n4. Arrange sliced fresh mozzarella and cherry tomatoes on top of the sauce.\n5. Drizzle olive oil over the pizza and sprinkle with fresh basil leaves.\n6. Transfer the pizza onto the hot pizza stone and bake for 10-12 minutes or until crust is golden brown and cheese is bubbly.\n7. Remove from oven, slice, and serve hot.',
      ingredients: [
        '1 lb pizza dough',
        '1/2 cup pizza sauce',
        '8 oz fresh mozzarella, sliced',
        '1 cup cherry tomatoes, halved',
        '2 tbsp olive oil',
        'Fresh basil leaves for garnish'
      ],
      image: Image.asset('assets/images/dishes/MargheritaPizza.jpg')),
  Recipe(
      title: 'Tacos Al Pastor',
      description:
          'A traditional Mexican dish featuring marinated pork cooked on a vertical spit.',
      instruction:
          '1. In a blender, combine diced onion, garlic, chipotle peppers, pineapple juice, vinegar, and spices. Blend until smooth.\n2. Place thinly sliced pork shoulder in a large bowl and pour marinade over the meat. Mix well to coat.\n3. Cover and refrigerate for at least 2 hours or overnight.\n4. Preheat grill or broiler. Skewer marinated pork slices onto metal skewers.\n5. Cook on the grill or under the broiler, turning occasionally, until pork is cooked through and slightly charred.\n6. Serve pork on warm corn tortillas with chopped onions, cilantro, and pineapple chunks.\n7. Garnish with lime wedges and salsa.',
      ingredients: [
        '1 onion, diced',
        '3 cloves garlic',
        '2 chipotle peppers in adobo sauce',
        '1/2 cup pineapple juice',
        '1/4 cup white vinegar',
        '1 tsp ground cumin',
        '1 tsp dried oregano',
        '1/2 tsp salt',
        '1/4 tsp black pepper',
        '1 lb pork shoulder, thinly sliced',
        'Corn tortillas, for serving',
        'Chopped onions, cilantro, pineapple chunks, lime wedges, and salsa for garnish'
      ],
      image: Image.asset('assets/images/dishes/TacosAlPastor.jpg')),
  Recipe(
      title: 'Greek Salad',
      description:
          'A refreshing salad with crisp vegetables, tangy feta cheese, and kalamata olives.',
      instruction:
          '1. In a large bowl, combine chopped cucumbers, tomatoes, red onions, and bell peppers.\n2. Add crumbled feta cheese and pitted kalamata olives.\n3. Drizzle olive oil and red wine vinegar over the salad.\n4. Season with dried oregano, salt, and black pepper.\n5. Toss gently to coat all ingredients evenly.\n6. Serve immediately as a side dish or with grilled chicken or fish for a complete meal.',
      ingredients: [
        '2 cucumbers, chopped',
        '2 tomatoes, chopped',
        '1/2 red onion, thinly sliced',
        '1 bell pepper, chopped',
        '1/2 cup crumbled feta cheese',
        '1/4 cup pitted kalamata olives',
        '2 tbsp olive oil',
        '1 tbsp red wine vinegar',
        '1 tsp dried oregano',
        'Salt and black pepper to taste'
      ],
      image: Image.asset('assets/images/dishes/GreekSalad.jpg')),
];

Widget resipeListContainer(Recipe _resipes) {
  return Container(
    padding: const EdgeInsets.all(5),
    margin: const EdgeInsets.all(8),
    alignment: Alignment.center,
    height: 290,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: Colors.black,
        width: 2,
      ),
    ),
    child: Column(
      children: [
        Text('${_resipes.title}', style: const TextStyle(fontSize: 30)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              width: 180,
              height: 200,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                child: _resipes.image,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              width: 120,
              height: 170,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
              child: SingleChildScrollView(
                  child: Text('${_resipes.description}',
                      style: const TextStyle(fontSize: 16))),
            )
          ],
        )
      ],
    ),
  );
}

class RecipesList extends StatefulWidget {
  const RecipesList({super.key});

  @override
  State<RecipesList> createState() => _RecipesListState();
}

class _RecipesListState extends State<RecipesList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: _recipes.length,
        itemBuilder: (BuildContext context, int index) {
          return resipeListContainer(_recipes[index]);
        });
  }
}
