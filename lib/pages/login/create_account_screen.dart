import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bike_kollective/pages/login/profile_page.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:bike_kollective/pages/login/login_screen.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create an Account"),
      ),
      body: const RegistrationForm(),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool? _success;
  String? _userEmail;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                hintText: "Email",
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Your Email";
                }
                return null;
              },
            ), // Email Form Field
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock_outlined),
                hintText: "Password",
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Your Password";
                }
                return null;
              },
            ), // Password Form Field
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                hintText: "Re-enter Password",
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Please Re-Enter Your Password";
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState!.validate()) {
                    // Process data.
                    _register();
                  }
                },
                child: const Text('Register'),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(_success == null
                  ? ''
                  : (_success!
                      ? 'Successfully registered ' + _userEmail!
                      : 'Registration failed')),
            ),
          ],
        ));
  }

  void _register() async {
    final User? user =
        (await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
            .user;
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
    } else {
      setState(() {
        _success = true;
      });
    }
  }
}

// ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:bike_kollective/pages/login/profile_page.dart';
// import 'package:bike_kollective/utils/fire_auth.dart';
// import 'package:bike_kollective/utils/validator.dart';

// class RegisterPage extends StatefulWidget {
//   const RegisterPage({Key? key}) : super(key: key);

//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   final _registerFormKey = GlobalKey<FormState>();

//   final _nameTextController = TextEditingController();
//   final _emailTextController = TextEditingController();
//   final _passwordTextController = TextEditingController();

//   final _focusName = FocusNode();
//   final _focusEmail = FocusNode();
//   final _focusPassword = FocusNode();

//   bool _isProcessing = false;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         _focusName.unfocus();
//         _focusEmail.unfocus();
//         _focusPassword.unfocus();
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Register'),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Form(
//                   key: _registerFormKey,
//                   child: Column(
//                     children: <Widget>[
//                       TextFormField(
//                         controller: _nameTextController,
//                         focusNode: _focusName,
//                         validator: (value) => Validator.validateName(
//                           name: value!,
//                         ),
//                         decoration: InputDecoration(
//                           hintText: "Name",
//                           errorBorder: UnderlineInputBorder(
//                             borderRadius: BorderRadius.circular(6.0),
//                             borderSide: BorderSide(
//                               color: Colors.red,
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 16.0),
//                       TextFormField(
//                         controller: _emailTextController,
//                         focusNode: _focusEmail,
//                         validator: (value) => Validator.validateEmail(
//                           email: value!,
//                         ),
//                         decoration: InputDecoration(
//                           hintText: "Email",
//                           errorBorder: UnderlineInputBorder(
//                             borderRadius: BorderRadius.circular(6.0),
//                             borderSide: BorderSide(
//                               color: Colors.red,
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 16.0),
//                       TextFormField(
//                         controller: _passwordTextController,
//                         focusNode: _focusPassword,
//                         obscureText: true,
//                         validator: (value) => Validator.validatePassword(
//                           password: value!,
//                         ),
//                         decoration: InputDecoration(
//                           hintText: "Password",
//                           errorBorder: UnderlineInputBorder(
//                             borderRadius: BorderRadius.circular(6.0),
//                             borderSide: BorderSide(
//                               color: Colors.red,
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 32.0),
//                       _isProcessing
//                           ? CircularProgressIndicator()
//                           : Row(
//                               children: [
//                                 Expanded(
//                                   child: ElevatedButton(
//                                     onPressed: () async {
//                                       setState(() {
//                                         _isProcessing = true;
//                                       });

//                                       if (_registerFormKey.currentState!
//                                           .validate()) {
//                                         User? user = await FireAuth
//                                             .registerUsingEmailPassword(
//                                           name: _nameTextController.text,
//                                           email: _emailTextController.text,
//                                           password:
//                                               _passwordTextController.text,
//                                         );

//                                         setState(() {
//                                           _isProcessing = false;
//                                         });

//                                         if (user != null) {
//                                           Navigator.of(context)
//                                               .pushAndRemoveUntil(
//                                             MaterialPageRoute(
//                                               builder: (context) =>
//                                                   ProfilePage(user: user),
//                                             ),
//                                             ModalRoute.withName('/'),
//                                           );
//                                         }
//                                       }
//                                     },
//                                     child: Text(
//                                       'Sign up',
//                                       style: TextStyle(color: Colors.white),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
