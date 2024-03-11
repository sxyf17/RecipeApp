import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:recipe_app/global_recipe_page.dart';

// Create a Form widget.
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  SignUpPageState createState() {
    return SignUpPageState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class SignUpPageState extends State<SignUpPage> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<SignUpPageState>.
  final _formKey = GlobalKey<FormBuilderState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(20),
      child: FormBuilder(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Name'),
            validator: (value) {
              RegExp nameRegex = RegExp(r'[A-Z]');
              if (!nameRegex.hasMatch(value!)) {
                return 'Please capitalize name';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (!value!.contains('.') || !value.contains('@')) {
                return 'Please enter valid email';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _dobController,
            decoration:
                const InputDecoration(labelText: 'Date of Birth (mm/dd/yyyy)'),
            validator: (value) {
              RegExp dateRegex = RegExp(r'^\d{2}/\d{2}/\d{4}$');
              if (!dateRegex.hasMatch(value!)) {
                return 'Please retry in correct format (mm/dd/yyyy)';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          FormBuilderTextField(
            name: 'password',
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
            validator: (value) {
              RegExp passwordRegex = RegExp(
                  r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
              if (!passwordRegex.hasMatch(value!)) {
                return 'Ensure password has 1 upper/lower case letter, number, special character, 8 character length';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GlobalRecipesPage(title: 'Global Recipes',)),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    ),)
    );
  }
}
