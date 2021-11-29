import 'package:bike_kollective/pages/login/profile_page.dart';
import 'package:bike_kollective/pages/upload_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:bike_kollective/utils/db/api_bikes.dart';
import 'package:bike_kollective/pages/login/profile_page.dart';

class AddBikeLocation extends StatefulWidget {
  const AddBikeLocation({Key? key, required this.bike, required this.user})
      : super(key: key);
  final String bike;
  final User user;

  @override
  _AddBikeLocationState createState() => _AddBikeLocationState();
}

class _AddBikeLocationState extends State<AddBikeLocation> {
  final _formKey = GlobalKey<FormState>();

  late User _currentUser;
  late String _currentBike;

  @override
  void initState() {
    _currentBike = widget.bike;
    _currentUser = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Bike Location'),
      ),
      // body: ,
      floatingActionButton: FloatingActionButton(
        child: Text('Next'),
        onPressed: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Processing Data')));
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => ProfilePage(user: _currentUser)));
        },
      ),
    );
  }
}

  // List formatters = [
  //   FilteringTextInputFormatter.digitsOnly,
  //   FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
  //   FilteringTextInputFormatter.deny(RegExp(r'[/\\]'))
  // ];
  // above was above override under the list
