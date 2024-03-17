import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../util/index.dart';
import 'log_in.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  SignUpPageState createState() {
    return SignUpPageState();
  }
}

class SignUpPageState extends State<SignUpPage> {
  late Box<User> loginBox;
  bool userIsValid = false;
  bool nameIsValid = false;
  bool emailIsValid = false;
  bool dobIsValid = false;
  bool passIsValid = false;

  final _formKey = GlobalKey<FormBuilderState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loginBox = HiveBoxManager().userLoginBox;
  }

  @override
  void dispose() {
    // Clean up the controllers to prevent memory leaks
    _nameController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _addLogin(User user) {
    loginBox.add(user);
  }

  bool checkValidUser() {
    if (nameIsValid && emailIsValid && dobIsValid && passIsValid) {
      userIsValid = true;
    }
    return userIsValid;
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
        ),
        body: GestureDetector(
          // to hide keyboard when tapping outside of textfields
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: 'Name'),
                      validator: (value) {
                        bool nameExists = loginBox.values.any((existingUser) =>
                            existingUser.username.toString() == value);
                        RegExp nameRegex = RegExp(r'[A-Z]');
                        if (!nameRegex.hasMatch(value!)) {
                          return 'Please capitalize name';
                        } else if (nameExists) {
                          return 'Username already taken';
                        } else {
                          nameIsValid = true;
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
                        bool emailExists = loginBox.values.any((existingUser) =>
                            existingUser.email.toString() == value);
                        if (!value!.contains('.') || !value.contains('@')) {
                          return 'Please enter valid email';
                        } else if (emailExists) {
                          return 'Email already taken';
                        } else {
                          emailIsValid = true;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _dobController,
                      decoration: const InputDecoration(
                          labelText: 'Date of Birth (mm/dd/yyyy)'),
                      validator: (value) {
                        RegExp dateRegex = RegExp(r'^\d{2}/\d{2}/\d{4}$');
                        if (!dateRegex.hasMatch(value!)) {
                          return 'Please retry in correct format (mm/dd/yyyy)';
                        } else {
                          dobIsValid = true;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      validator: (value) {
                        RegExp passwordRegex = RegExp(
                            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
                        if (!passwordRegex.hasMatch(value!)) {
                          return 'Requires 1 upr/lwr case ltr, num, special char, 8 char length';
                        } else {
                          passIsValid = true;
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
                          if (_formKey.currentState!.validate()) {
                            
                            _addLogin(User(
                                username: _nameController.text,
                                dob: _dobController.text,
                                email: _emailController.text,
                                password: _passwordController.text));
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RecipeHome()),
                            );
                          }
                        },
                        child: const Text('Submit'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
