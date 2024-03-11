import 'package:flutter/material.dart';
import 'package:recipe_app/util/index.dart';
import 'package:recipe_app/views/sign_up.dart';

class RecipeHome extends StatefulWidget {
  const RecipeHome({super.key});



  @override
  State<RecipeHome> createState() => _RecipeHomeState();
}

class _RecipeHomeState extends State<RecipeHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/app_logo.webp',
              height: 75,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Welcome to Recipe App!',
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/food_icon.jpeg',
                    fit: BoxFit.fill,
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  hintText: 'Username...',
                ),
              ),
            ),
            const SizedBox(height: 5),
            const SizedBox(
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    hintText: 'Password...'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GlobalRecipesPage(title: 'Global Recipes',)),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange[100]),
                child: const Text('Log In')),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                   MaterialPageRoute(builder: (context) => const SignUpPage())
                   );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange[100]),
                child: const Text('Sign Up'))
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
