import 'package:flutter/material.dart';

import 'package:bike_kollective/pages/user_image.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({Key? key}) : super(key: key);

  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  String imageUrl = '';

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
          })
        ]));
  }
}
