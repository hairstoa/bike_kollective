import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:bike_kollective/utils/db/api_bikes.dart';
import 'package:bike_kollective/pages/login/profile_page.dart';
import 'package:bike_kollective/pages/login/profile_page.dart';
import 'package:bike_kollective/pages/upload_image.dart';

class AddBikeLocation extends StatefulWidget {
  const AddBikeLocation({Key? key, required this.bike, required this.user})
      : super(key: key);
  final String bike;
  final User user;

  @override
  _AddBikeLocationState createState() => _AddBikeLocationState();
}

class _AddBikeLocationState extends State<AddBikeLocation> {
  late User _currentUser;
  late String _currentBike;

  Future _shareUserLocation() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    var updatedLoc = {
      'location': GeoPoint(_locationData.latitude!, _locationData.longitude!)
    };
    // var updatedLoc = {
    //   location: [_locationData.latitude!, _locationData.longitude!]
    // };
    BikesApiService.updateBike(_currentBike, updatedLoc);
  }

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
      body: Row(
        children: [
          ElevatedButton(
            onPressed: () {
              print('Sharing Location');
              _shareUserLocation();
            },
            child: Text(
              'Share My Location',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('Finish'),
        onPressed: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Bike added!')));
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
