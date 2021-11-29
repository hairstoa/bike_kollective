import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:bike_kollective/utils/db/api_bikes.dart';
import 'package:bike_kollective/pages/add_bike/add_bike_location.dart';
import 'package:bike_kollective/pages/user_image.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({Key? key, required this.bike, required this.user})
      : super(key: key);
  final String bike;
  final User user;

  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  String imageUrl = '';

  late String _currentBike;
  late User _currentUser;

  @override
  void initState() {
    _currentBike = widget.bike;
    _currentUser = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Upload')),
      body: ListView(children: [
        const SizedBox(height: 15),
        UserImage(onFileChanged: (imageUrl) {
          setState(() {
            this.imageUrl = imageUrl;
          });
          var imageUpdate = {'image': imageUrl};
          BikesApiService.updateBike(_currentBike, imageUpdate);
        }),
      ]),
      floatingActionButton: FloatingActionButton(
        child: Text('Next'),
        onPressed: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Processing Data')));
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) =>
                  AddBikeLocation(bike: _currentBike, user: _currentUser)));
        },
      ),
    );
  }
}
