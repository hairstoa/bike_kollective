//import 'package:car_rental_app/data/constants.dart';
import 'package:bike_kollective/utils/build_container.dart';
import 'package:flutter/material.dart';

class BuildAppBar extends StatelessWidget {
  final String iconUrl;
  final Function func;

  const BuildAppBar({Key? key, required this.iconUrl, required this.func})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            print("Nice choice!");
          },
          child: BuildContainer(
            color: Colors.blueGrey,
            child: Image(
              image: AssetImage(iconUrl),
              color: Colors.white,
            ),
          ),
        ),
        Spacer(),
        BuildContainer(
          color: Colors.grey,
          child: Image(
            image: AssetImage('bike'),
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        BuildContainer(
          color: Colors.blue,
          child: Image(
            image: AssetImage('bike'),
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
