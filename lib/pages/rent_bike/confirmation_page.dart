import 'package:bike_kollective/pages/login/login_screen.dart';
import 'package:bike_kollective/pages/rent_bike/confirmation_page.dart';
import 'package:bike_kollective/utils/fire_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:image_picker_ui/image_picker_handler.dart';
import 'package:bike_kollective/pages/rent_bike/bike_details.dart';
import 'package:bike_kollective/utils/fire_auth.dart';

// class confirmRent extends StatefulWidget {
//   const confirmRent{Key? key, required this.user}) : super(key: key);
//   final User user;

//   //const ProfilePage({required this.user});

//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   bool _isSendingVerification = false;
//   bool _isSigningOut = false;
//   bool _isEmailVerified = false;

//   late User _currentUser;

//   @override
//   void initState() {
//     _currentUser = widget.user;
//     super.initState();
// //       _controller = new AnimationController(
// //       vsync: this,
// //       duration: const Duration(milliseconds: 500),
// //     );

// //     imagePicker=new ImagePickerHandler(this,_controller);
// //     imagePicker.init();

// //  }

// ignore: camel_case_types
class ConfirmationPage extends StatefulWidget {
  const ConfirmationPage({Key? key, required this.user}) : super(key: key);
  final User user;

  //const ProfilePage({required this.user});

  @override
  _ConfirmationPageState createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  bool _isSendingVerification = false;
  bool _isSigningOut = false;
  bool _isEmailVerified = false;

  late User _currentUser;

  void initState() {
    _currentUser = FirebaseAuth.instance.currentUser!;
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
          title: Text('confirm your rental'),
        ),
        //Expanded(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
            child: Text(
              'Profile Page',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ));
    return ConfirmationPage(user: _currentUser);
  } //
}
