// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables
// Import the provider plugin
import 'package:bike_kollective/pages/login/profile_page.dart';
import 'package:bike_kollective/pages/login/register.dart';
import 'package:flutter/material.dart';
// Import the firebase plugins
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:bike_kollective/utils/validator.dart';
import 'package:bike_kollective/utils/fire_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ProfilePage(
            user: user,
          ),
        ),
      );
    }

    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('The Bike Kollective'),
        ),
        body: FutureBuilder(
          future: _initializeFirebase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: _emailTextController,
                            focusNode: _focusEmail,
                            validator: (value) => Validator.validateEmail(
                              email: value!,
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email, color: Colors.blue),
                              hintText: "Email",
                              errorBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          TextFormField(
                            controller: _passwordTextController,
                            focusNode: _focusPassword,
                            obscureText: true,
                            validator: (value) =>
                                Validator.validatePassword(password: value!),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock, color: Colors.blue),
                              hintText: "Password",
                              errorBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 24.0),
                          _isProcessing
                              ? CircularProgressIndicator()
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          _focusEmail.unfocus();
                                          _focusPassword.unfocus();

                                          if (_formKey.currentState!
                                              .validate()) {
                                            setState(() {
                                              _isProcessing = true;
                                            });

                                            User? user = await FireAuth
                                                .signInUsingEmailPassword(
                                              email: _emailTextController.text,
                                              password:
                                                  _passwordTextController.text,
                                            );

                                            setState(() {
                                              _isProcessing = false;
                                            });

                                            if (user != null) {
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProfilePage(user: user),
                                                ),
                                              );
                                            }
                                          }
                                        },
                                        child: Text(
                                          'Sign In',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 24.0),
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  RegisterPage(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'Register',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                        ],
                      ),
                    )
                  ],
                ),
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
