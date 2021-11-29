import 'package:flutter/material.dart';

import 'package:bike_kollective/utils/db/api_bikes.dart';
import 'package:bike_kollective/pages/user_image.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({Key? key, required this.bike}) : super(key: key);
  final String bike;

  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  String imageUrl = '';

  late String _currentBike;

  @override
  void initState() {
    _currentBike = widget.bike;
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
          })
        ]));
  }
}
