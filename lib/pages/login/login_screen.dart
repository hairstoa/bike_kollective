// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:bike_kollective/utils/style.dart';
// // import 'package:bike_kollective/pages/login/create_account_screen.dart';

// // class LoginScreen extends StatefulWidget {
// //   @override
// //   _LoginScreenState createState() => _LoginScreenState();
// // }

// // class _LoginScreenState extends State<LoginScreen> {
// //   //bool _rememberMe = false;

// // // build the email text field
// // // style imported from style file #poet
// //   Widget _buildEmailTF() {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: <Widget>[
// //         Text(
// //           'Email',
// //           style: labelStyle,
// //         ),
// //         SizedBox(height: 10.0),
// //         Container(
// //           alignment: Alignment.centerLeft,
// //           decoration: boxDecorationStyle,
// //           height: 60.0,
// //           child: TextField(
// //             keyboardType: TextInputType.emailAddress,
// //             style: TextStyle(
// //               color: Colors.white,
// //               fontFamily: 'OpenSans',
// //             ),
// //             decoration: InputDecoration(
// //               border: InputBorder.none,
// //               contentPadding: EdgeInsets.only(top: 14.0),
// //               prefixIcon: Icon(
// //                 Icons.email,
// //                 color: Colors.white,
// //               ),
// //               hintText: 'Enter your Email',
// //               hintStyle: pwHintTextStyle,
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }

// // // widget builds the password field
// // // would like to extend to have the obscuretext so password enters as *
// //   Widget _buildPasswordTF() {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: <Widget>[
// //         Text(
// //           'Password',
// //           style: labelStyle,
// //         ),
// //         SizedBox(height: 10.0),
// //         Container(
// //           alignment: Alignment.centerLeft,
// //           decoration: boxDecorationStyle,
// //           height: 60.0,
// //           child: TextField(
// //             obscureText: true,
// //             style: TextStyle(
// //               color: Colors.white,
// //               fontFamily: 'OpenSans',
// //             ),
// //             decoration: InputDecoration(
// //               border: InputBorder.none,
// //               contentPadding: EdgeInsets.only(top: 14.0),
// //               prefixIcon: Icon(
// //                 Icons.lock,
// //                 color: Colors.white,
// //               ),
// //               hintText: 'Enter your Password',
// //               hintStyle: pwHintTextStyle,
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }

// // // option if you forgot password
// // // need to create routes for this
// //   Widget _buildForgotPasswordBtn() {
// //     return Container(
// //       alignment: Alignment.centerRight,
// //       child: FlatButton(
// //         onPressed: () => print('Forgot Password Button Pressed'),
// //         padding: EdgeInsets.only(right: 0.0),
// //         child: Text(
// //           'Forgot Password?',
// //           style: labelStyle,
// //         ),
// //       ),
// //     );
// //   }

// //   // Widget _buildRememberMeCheckbox() {
// //   //   return Container(
// //   //     height: 20.0,
// //   //     child: Row(
// //   //       children: <Widget>[
// //   //         Theme(
// //   //           data: ThemeData(unselectedWidgetColor: Colors.white),
// //   //           child: Checkbox(
// //   //             value: _rememberMe,
// //   //             checkColor: Colors.green,
// //   //             activeColor: Colors.white,
// //   //             onChanged: (value) {
// //   //               setState(() {
// //   //                 _rememberMe = value;
// //   //               });
// //   //             },
// //   //           ),
// //   //         ),
// //   //         Text(
// //   //           'Remember me',
// //   //           style: labelStyle,
// //   //         ),
// //   //       ],
// //   //     ),
// //   //   );
// //   // }

// // // login button
// // // then route to main page of app
// //   Widget _buildLoginBtn() {
// //     return Container(
// //       padding: EdgeInsets.symmetric(vertical: 25.0),
// //       width: double.infinity,
// //       child: RaisedButton(
// //         elevation: 5.0,
// //         onPressed: () => print('Login Button Pressed'),
// //         padding: EdgeInsets.all(15.0),
// //         shape: RoundedRectangleBorder(
// //           borderRadius: BorderRadius.circular(30.0),
// //         ),
// //         color: Colors.white,
// //         child: Text(
// //           'LOGIN',
// //           style: TextStyle(
// //             color: Color(0xFF527DAA),
// //             letterSpacing: 1.5,
// //             fontSize: 18.0,
// //             fontWeight: FontWeight.bold,
// //             fontFamily: 'OpenSans',
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// // //  this would be the start of adding socials if we wanted
// //   // Widget _buildSignInWithText() {
// //   //   return Column(
// //   // children: <Widget>[
// //   //   Text(
// //   //     '- OR -',
// //   //     style: TextStyle(
// //   //       color: Colors.white,
// //   //       fontWeight: FontWeight.w400,
// //   //     ),
// //   //   ),
// //   //   SizedBox(height: 20.0),
// //   //   Text(
// //   //     'Sign in with',
// //   //     style: labelStyle,
// //   //   ),
// //   // ],
// //   //   );
// //   // }

// // // if we wanted to add socials
// //   // Widget _buildSocialBtn(Function onTap, AssetImage logo) {
// //   //   return GestureDetector(
// //   //     //onTap: onTap,
// //   //     child: Container(
// //   //       height: 60.0,
// //   //       width: 60.0,
// //   //       decoration: BoxDecoration(
// //   //         shape: BoxShape.circle,
// //   //         color: Colors.white,
// //   //         boxShadow: [
// //   //           BoxShadow(
// //   //             color: Colors.black26,
// //   //             offset: Offset(0, 2),
// //   //             blurRadius: 6.0,
// //   //           ),
// //   //         ],
// //   //         image: DecorationImage(
// //   //           image: logo,
// //   //         ),
// //   //       ),
// //   //     ),
// //   //   );
// //   // }

// //   // Widget _buildSocialBtnRow() {
// //   //   return Padding(
// //   //     padding: EdgeInsets.symmetric(vertical: 30.0),
// //   //     child: Row(
// //   //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //   //       children: <Widget>[
// //   //         _buildSocialBtn(
// //   //           () => print('Login with Facebook'),
// //   //           AssetImage(
// //   //             'assets/logos/facebook.jpg',
// //   //           ),
// //   //         ),
// //   //         _buildSocialBtn(
// //   //           () => print('Login with Google'),
// //   //           AssetImage(
// //   //             'assets/logos/google.jpg',
// //   //           ),
// //   //         ),
// //   //       ],
// //   //     ),
// //   //   );
// //   // }

// //   Widget _buildSignupBtn() {
// //     return GestureDetector(
// //       onTap: () {
// //         Navigator.push(
// //           context,
// //           MaterialPageRoute(builder: (context) => CreateAccount()),
// //         );
// //       },
// //       child: RichText(
// //         text: TextSpan(
// //           children: [
// //             TextSpan(
// //               text: 'Don\'t have an Account? ',
// //               style: TextStyle(
// //                 color: Colors.white,
// //                 fontSize: 18.0,
// //                 fontWeight: FontWeight.w400,
// //               ),
// //             ),
// //             TextSpan(
// //               text: 'Sign Up',
// //               style: TextStyle(
// //                 color: Colors.white,
// //                 fontSize: 18.0,
// //                 fontWeight: FontWeight.bold,
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: AnnotatedRegion<SystemUiOverlayStyle>(
// //         value: SystemUiOverlayStyle.light,
// //         child: GestureDetector(
// //           onTap: () => FocusScope.of(context).unfocus(),
// //           child: Stack(
// //             children: <Widget>[
// //               Container(
// //                 height: double.infinity,
// //                 width: double.infinity,
// //                 decoration: BoxDecoration(
// //                   gradient: LinearGradient(
// //                     begin: Alignment.topCenter,
// //                     end: Alignment.bottomCenter,
// //                     colors: [
// //                       Color(0xFF73AEF5),
// //                       Color(0xFF61A4F1),
// //                       Color(0xFF478DE0),
// //                       Color(0xFF398AE5),
// //                     ],
// //                     stops: [0.1, 0.4, 0.7, 0.9],
// //                   ),
// //                 ),
// //               ),
// //               Container(
// //                 height: double.infinity,
// //                 child: SingleChildScrollView(
// //                   physics: AlwaysScrollableScrollPhysics(),
// //                   padding: EdgeInsets.symmetric(
// //                     horizontal: 40.0,
// //                     vertical: 120.0,
// //                   ),
// //                   child: Column(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: <Widget>[
// //                       Text(
// //                         'Sign In',
// //                         style: TextStyle(
// //                           color: Colors.white,
// //                           fontFamily: 'OpenSans',
// //                           fontSize: 30.0,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                       SizedBox(height: 30.0),
// //                       _buildEmailTF(),
// //                       SizedBox(
// //                         height: 30.0,
// //                       ),
// //                       _buildPasswordTF(),
// //                       _buildForgotPasswordBtn(),
// //                       //_buildRememberMeCheckbox(),
// //                       _buildLoginBtn(),
// //                       //_buildSignInWithText(),
// //                       // _buildSocialBtnRow(),
// //                       _buildSignupBtn(),
// //                     ],
// //                   ),
// //                 ),
// //               )
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

// //1
// import 'package:flutter/material.dart';
// //
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
// import 'package:bike_kollective/pages/login/create_account_screen.dart';
// import 'package:bike_kollective/main.dart';
// import 'package:bike_kollective/authentication_service.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// //3

// class LoginScreen extends StatefulWidget {
//   LoginScreen({Key? key, required this.title}) : super(key: key);
//   final String title;

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// // class _LoginScreenState extends State<LoginScreen> {

// class _LoginScreenState extends State<LoginScreen> {
// //4
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         actions: <Widget>[
//           Builder(builder: (BuildContext context) {
// //5
//             return TextButton(
//                 child: const Text('Sign out'),
//                 style: TextButton.styleFrom(
//                   textStyle: const TextStyle(fontSize: 14),
//                 ),
//                 onPressed: () {
//                   _signOut();
//                 }
//                 //   final User user = await auth.currentUser();
//                 //   if (user) {
//                 //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                 //     content: Text(user.uid + ' has successfully signed out.'),
//                 //   ));}
//                 //   else {
//                 //     Text('No one has signed in.');
//                 //     }
//                 //     return;
//                 //   }
//                 //     Future <LoginScreen> _signOut()  async{
//                 //     final UserCredential credential = await FirebaseAuth.instance.signOut();
//                 //     String uid = credential.user.uid;
//                 // //await FirebaseAuth.signOut();
//                 // //final String uid = User.uid;
//                 );
//           })
//         ],
//       ),
//       body: Builder(builder: (BuildContext context) {
// //7
//         return ListView(
//           scrollDirection: Axis.vertical,
//           padding: const EdgeInsets.all(16),
//           children: <Widget>[
//             _EmailPasswordForm(),
//           ],
//         );
//       }),
//     );
//   }

//   Future<void> _signOut() async {
//     await FirebaseAuth.instance.signOut();
//   }
// }

// class _EmailPasswordForm extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _EmailPasswordFormState();
// }

// class _EmailPasswordFormState extends State<_EmailPasswordForm> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool? _success;
//   String? _userEmail;
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Container(
//             child: const Text('Sign in with email and password'),
//             padding: const EdgeInsets.all(16),
//             alignment: Alignment.center,
//           ),
//           TextFormField(
//             controller: _emailController,
//             decoration: const InputDecoration(labelText: 'Email'),
//             validator: (String? value) {
//               if (value!.isEmpty) {
//                 return 'Please enter some text';
//               }
//               return null;
//             },
//           ),
//           TextFormField(
//             controller: _passwordController,
//             decoration: const InputDecoration(labelText: 'Password'),
//             validator: (String? value) {
//               if (value!.isEmpty) {
//                 return 'Please enter some text';
//               }
//               return null;
//             },
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(vertical: 16.0),
//             alignment: Alignment.center,
//             child: ElevatedButton(
//               onPressed: () async {
//                 if (_formKey.currentState!.validate()) {
//                   _signInWithEmailAndPassword();
//                 }
//               },
//               child: const Text('Submit'),
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(vertical: 16.0),
//             alignment: Alignment.center,
//             child: ElevatedButton(
//               onPressed: () {
//                 _navigateToNextScreen(context);
//               },
//               child: const Text('Create Account'),
//             ),
//           ),
//           Container(
//             alignment: Alignment.center,
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Text(
//               _success == null
//                   ? ''
//                   : (_success!
//                       ? 'Successfully signed in ' + _userEmail!
//                       : 'Sign in failed'),
//               style: TextStyle(color: Colors.red),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   void _navigateToNextScreen(BuildContext context) {
//     Navigator.of(context)
//         .push(MaterialPageRoute(builder: (context) => CreateAccount()));
//   }

//   void _signInWithEmailAndPassword() async {
//     //  final UserCredential user = (await FirebaseAuth.signInWithEmailAndPassword(
//     //   email: _emailController.text,
//     //   password: _passwordController.text,
//     // )).user as UserCredential;
//     UserCredential result = await auth.signInWithEmailAndPassword(
//         email: _emailController.text, password: _passwordController.text);
//     final User user = result.user!;

//     //return myUser;

//     // ignore: unnecessary_null_comparison
//     if (user != null) {
//       setState(() {
//         _success = true;
//         _userEmail = user.email;
//       });
//     } else {
//       setState(() {
//         _success = false;
//       });
//     }
//   }
// }

// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bike_kollective/pages/login/create_account_screen.dart';
import 'package:bike_kollective/utils/fire_auth.dart';
import 'package:bike_kollective/utils/validator.dart';
import 'package:bike_kollective/pages/login/profile_page.dart';

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
          builder: (context) => LoginPage(),
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
          title: Text('Login'),
        ),
        body: FutureBuilder(
          future: _initializeFirebase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: Text(
                        'Login',
                        style: Theme.of(context).textTheme.headline1,
                      ),
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
                            validator: (value) => Validator.validatePassword(
                              password: value!,
                            ),
                            decoration: InputDecoration(
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

                                            User? myUser = await FireAuth
                                                .signInUsingEmailPassword(
                                              email: _emailTextController.text,
                                              password:
                                                  _passwordTextController.text,
                                            );

                                            setState(() {
                                              _isProcessing = false;
                                            });

                                            if (myUser != null) {
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProfilePage(
                                                          user: myUser!),
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
