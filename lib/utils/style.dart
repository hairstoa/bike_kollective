import 'package:flutter/material.dart';

// adapted from https://flutter.dev/docs/cookbook/design/themes
// we should look into a theme and having that be consistent

const pwHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

const labelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

const boxDecorationStyle = BoxDecoration(
  color: Color(0xFF6CA8F1),
  // ignore: unnecessary_const
  //borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
