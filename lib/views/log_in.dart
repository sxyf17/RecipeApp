import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quick_plate/util/index.dart';
import 'package:quick_plate/views/sign_up.dart';

class RecipeHome extends StatefulWidget {
  const RecipeHome({super.key});

  @override
  State<RecipeHome> createState() => _RecipeHomeState();
}

class _RecipeHomeState extends State<RecipeHome> {
  late Box<User> loginBox;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Add a delay before accessing the Hive box
    Future.delayed(const Duration(milliseconds: 5000), () {
      loginBox = HiveBoxManager().userLoginBox;
      setState(() {}); // Trigger a rebuild after initialization
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
              'Welcome to QuickPlate!',
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Your fast recipe companion',
              style: TextStyle(fontSize: 15, color: Colors.grey),
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
            SizedBox(
              width: 250,
              child: TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  hintText: 'Username...',
                ),
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: 250,
              child: TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
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
                  String username = _nameController.text;
                  String password = _passwordController.text;
                  bool userExists = loginBox.values.any((user) =>
                      user.username.toString() == username &&
                      user.password.toString() == password);

                  if (userExists) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const LikedRecipesScreen(title: 'Liked Recipes'),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Invalid username or password'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange[100]),
                child: const Text('Log In')),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpPage()));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange[100]),
                child: const Text('Sign Up'))
          ],
        ),
      ),
    );
  }
}
