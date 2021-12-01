import 'package:bike_kollective/models/bike_model.dart';
import 'package:bike_kollective/pages/login/login_screen.dart';
import 'package:bike_kollective/pages/rent_bike/confirmation_page.dart';
import 'package:bike_kollective/utils/fire_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:image_picker_ui/image_picker_handler.dart';
import 'package:bike_kollective/utils/fire_auth.dart';
import 'package:bike_kollective/pages/rent_bike/cart.dart';

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

// book bike - tracks the state of the bike to measure rental duration
class BookBike extends StatefulWidget {
  const BookBike({Key? key, required this.bike}) : super(key: key);

  final Bike bike;

  @override
  _BookBikeState createState() => _BookBikeState();
}

class _BookBikeState extends State<BookBike> {
  int _currentImage = 0;

  List<Widget> buildPageIndicator() {
    List<Widget> list = [];
    for (var i = 0; i < widget.bike.image.length; i++) {
      list.add(buildIndicator(i == _currentImage));
    }
    return list;
  }

  Widget buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 6),
      height: 8,
      width: isActive ? 20 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey[400],
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
