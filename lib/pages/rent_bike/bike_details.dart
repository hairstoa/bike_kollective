//import 'package:bike_kollective/data/constants.dart';
import 'package:bike_kollective/models/bike.dart';
import 'package:bike_kollective/utils/App_Bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class DetailScreen extends StatefulWidget {
  final Bike bike;
  const DetailScreen({Key? key, required this.bike}) : super(key: key);
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor:,
      body: Padding(
        //padding: EdgeInsets.only(left: Padding, right: mpadding,top: 30),
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BuildAppBar(
                iconUrl: 'assets/icons/left-arrow.png',
                func: () {
                  Navigator.of(context).pop();
                }),
            SizedBox(
              height: 20,
            ),
            _buildRichText(),
            Hero(
                tag: widget.bike.id,
                child: Container(
                  width: double.infinity,
                  height: 170,
                  child: Image.asset(
                    widget.bike.image,
                    fit: BoxFit.cover,
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildCircleAvatar(Colors.grey),
                SizedBox(
                  width: 10,
                ),
                _buildCircleAvatar(Colors.white),
                SizedBox(
                  width: 10,
                ),
                _buildCircleAvatar(Colors.grey),
                SizedBox(
                  width: 10,
                ),
                _buildCircleAvatar(Colors.grey),
              ],
            ),
            _buildText('Specification'),
            BuildGrid(),
            _buildText('Gallery'),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNav(widget.bike.height),
    );
  }

  _buildRichText() {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: '${widget.bike.type}\n',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 35,
              letterSpacing: 1.1),
        ),
        TextSpan(
          text: '${widget.bike.name}\n',
          style:
              TextStyle(color: Colors.grey, fontSize: 16, letterSpacing: 1.5),
        )
      ]),
    );
  }

  CircleAvatar _buildCircleAvatar(Color color) {
    return CircleAvatar(
      radius: 6,
      backgroundColor: color,
    );
  }

  _buildText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        letterSpacing: 1.1,
      ),
    );
  }
}

buildBottomNav(double price) {
  return Stack(
    children: <Widget>[
      Container(
        width: double.infinity,
        height: 60,
        color: Colors.blueGrey,
      ),
      Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: 'Per Day\n',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      letterSpacing: 1.1,
                    )),
                TextSpan(
                    text: '\$$price',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green[300],
                      fontSize: 25,
                      letterSpacing: 1.1,
                    )),
              ]),
            ),
          ),
          Spacer(),
          Expanded(
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  'Rent Now',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      )
    ],
  );
}

class BuildGrid extends StatelessWidget {
  final List<Map<String, dynamic>> specification = [
    {
      'icon': 'assets/icons/engine.png',
      'title': 'Engine Power',
      'description': '650 CV (463 KW)',
      'color': Colors.grey
    },
    {
      'icon': 'assets/icons/windshield.png',
      'title': 'Accleration',
      'description': '0-200 km/hr - 3.5s',
      'color': Colors.blueGrey[700]
    },
    {
      'icon': 'assets/icons/dashboard.png',
      'title': 'Max Speed',
      'description': '432 km/hr',
      'color': Colors.lightGreen
    },
    {
      'icon': 'assets/icons/information.png',
      'title': 'Max Torque',
      'description': '523Nm @6.700 rpm',
      'color': Colors.blueAccent
    },
    {
      'icon': 'assets/icons/breakdown.png',
      'title': 'Breaks',
      'description': '8 Pistons(front)',
      'color': Colors.green
    },
    {
      'icon': 'assets/icons/climatization.png',
      'title': 'Seats',
      'description': '2 Seats',
      'color': Colors.black
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          itemCount: specification.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemBuilder: (context, index) => GridItem(
                color: specification[index]['color'],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      specification[index]['icon'],
                      height: 45,
                      width: 45,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: FittedBox(
                        child: Text(
                          specification[index]['title'],
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              letterSpacing: 1.1),
                        ),
                      ),
                    ),
                    Expanded(
                      child: FittedBox(
                        child: Text(
                          specification[index]['description'],
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                              letterSpacing: 1.1),
                        ),
                      ),
                    )
                  ],
                ),
              )),
    );
  }
}

class GridItem extends StatelessWidget {
  final Widget child;
  final Color color;
  const GridItem({Key? key, required this.color, required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
