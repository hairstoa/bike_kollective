// ignore_for_file: prefer_const_constructors

// import 'package:bike_kollective/pages/DemoApi.dart';
import 'package:bike_kollective/pages/login/login_screen.dart';
import 'package:bike_kollective/pages/rent_bike/bike_catalog.dart';
import 'package:bike_kollective/pages/rent_bike/cart.dart';
import 'package:bike_kollective/pages/rent_bike/confirmation_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:image_picker_ui/image_picker_handler.dart';
import 'package:bike_kollective/utils/fire_auth.dart';
import 'package:bike_kollective/pages/add_bike/add_bike.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, required this.user}) : super(key: key);
  final User user;

  //const ProfilePage({required this.user});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isSendingVerification = false;
  bool _isSigningOut = false;
  bool _isEmailVerified = false;

  late User _currentUser;

  @override
  void initState() {
    _currentUser = widget.user;
    super.initState();
//       _controller = new AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 500),
//     );

//     imagePicker=new ImagePickerHandler(this,_controller);
//     imagePicker.init();

//  }

    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      throw UnimplementedError();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'NAME: ${_currentUser.displayName}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 16.0),
            Text(
              'EMAIL: ${_currentUser.email}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 16.0),
            _currentUser.emailVerified
                ? Text(
                    'Email verified',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.green),
                  )
                : Text(
                    'Email not verified',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.red),
                  ),
            SizedBox(height: 16.0),
            _isSendingVerification
                ? CircularProgressIndicator()
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            _isSendingVerification = true;
                          });
                          await _currentUser.sendEmailVerification();
                          setState(() {
                            _isSendingVerification = false;
                          });
                        },
                        child: Text('Verify email'),
                      ),
                      SizedBox(width: 8.0),
                      IconButton(
                        icon: Icon(Icons.refresh),
                        onPressed: () async {
                          //User? user = await FireAuth.refreshUser(_currentUser);
                          User? user = FirebaseAuth.instance.currentUser;
                          if (user != null) {
                            setState(() {
                              _currentUser = user;
                            });
                          }
                        },
                      ),
                    ],
                  ),
            SizedBox(height: 16.0),
            // TEST
            // _isSigningOut
            //     ? CircularProgressIndicator()
            //     : ElevatedButton(
            //         onPressed: () {
            //           Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //                 builder: (context) => AddBike(user: _currentUser)),
            //           );
            //         },
            //         child: Text('Add Bike'),
            //         style: ElevatedButton.styleFrom(
            //           primary: Colors.green,
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(30),
            //           ),
            //         ),
            //       ),
            // END TEST
            _isSigningOut
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        _isSigningOut = true;
                      });
                      await FirebaseAuth.instance.signOut();
                      setState(() {
                        _isSigningOut = false;
                      });
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: Text('Sign out'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
            // TEST
            _isSigningOut
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddBike(user: _currentUser)),
                      );
                    },
                    child: Text('Add Bike'),
                  ),
            // END TEST
            // ElevatedButton(
            //     child: Text('Add Bike'),
            //     onPressed: () {
            //       Navigator.of(context).pushReplacement(MaterialPageRoute(
            //           builder: (context) => AddBike(user: _currentUser)));
            //     }),
            ElevatedButton(
                child: Text('Confirmation Page'),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) =>
                          ConfirmationPage(user: _currentUser)));
                }),
            ElevatedButton(
                child: Text('bike catalog'),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => MyCatalog()));
                }),
          ],
        ),
      ),
    );
  }
}
