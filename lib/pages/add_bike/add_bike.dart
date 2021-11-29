import 'package:bike_kollective/pages/upload_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:bike_kollective/utils/db/api_bikes.dart';

class AddBike extends StatefulWidget {
  const AddBike({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  _AddBikeState createState() => _AddBikeState();
}

// class _AddBikeState extends State<AddBike> {
//   final _formKey = GlobalKey<FormState>();
//   List validators = [
//     (value) {
//       if (value == null || value.isEmpty) {
//         return 'Please enter the type of bike (ex. road)';
//       }
//       return null;
//     },
//     (value) {
//       if (value == null || value.isEmpty) {
//         return 'Please enter the frame size';
//       }
//       return null;
//     },
//     (value) {
//       if (value == null || value.isEmpty) {
//         return 'Please enter the frame unit (ex. cm)';
//       }
//       return null;
//     },
//     (value) {
//       if (value == null || value.isEmpty) {
//         return 'Please enter a description';
//       }
//       return null;
//     },
//     (value) {
//       if (value == null || value.isEmpty) {
//         return 'Please enter the lock combination';
//       }
//       return null;
//     }
//   ];

//   List<String> inputHints = [
//     "Bike Type",
//     "Frame Size",
//     "Frame Unit",
//     "Description",
//     "Lock Combination"
//   ];

//   // Map<int,TextEditingController> controllers = {};
//   Map<String, TextEditingController> _textControllers = new Map();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Form(
//         key: _formKey,
//         child: ListView.builder(
//           itemCount: validators.length,
//           itemBuilder: (context, index) {
//             return TextFormField(
//               validator: validators[index],
//               decoration: InputDecoration(
//                 hintText: inputHints[index],
//                 errorBorder: UnderlineInputBorder(
//                   borderRadius: BorderRadius.circular(6.0),
//                   borderSide: BorderSide(
//                     color: Colors.red,
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Text('Add Bike'),
//         onPressed: () {
//           if (_formKey.currentState!.validate()) {
//             // If the form is valid, display a snackbar. In the real world,
//             // you'd often call a server or save the information in a database.
//             print(validators);
//             ScaffoldMessenger.of(context)
//                 .showSnackBar(SnackBar(content: Text('Processing Data')));
//           }
//         },
//       ),
//     );
//   }
// }

class _AddBikeState extends State<AddBike> {
  final _formKey = GlobalKey<FormState>();
  String dropdownValueOne = 'Road';
  String dropdownValueTwo = 'cm';

  late User _currentUser;

  @override
  void initState() {
    _currentUser = widget.user;
    super.initState();
  }

  final _frameSizeTextController = TextEditingController();
  final _passcodeTextController = TextEditingController();

  final _focusFrameSize = FocusNode();
  final _focusPasscode = FocusNode();

  var newBike = {
    'available': true,
    'averageStars': 5,
    'checkoutDate': null,
    'condition': '',
    'description': '',
    'frameSize': '',
    'frameUnit': '',
    'image': '',
    'location': null,
    'lockCombination': '',
    'maintenanceRequest': false,
    'missing': false,
    'ownerID': '',
    'ratings': null,
    'renterID': null,
    'reportedIssues': [],
    'type': ''
  };

  List validators = [
    (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter the type of bike';
      }
      return null;
    },
    (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter the frame size';
      }
      return null;
    },
    (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter the frame unit';
      }
      return null;
    },
    (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter the lock combination';
      }
      return null;
    }
  ];

  List<String> inputHints = [
    "Bike Type",
    "Frame Size",
    "Frame Unit",
    "Lock Combination"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Bike'),
      ),
      body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              DropdownButton<String>(
                value: dropdownValueOne,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.blue),
                underline: Container(
                  height: 2,
                  color: Colors.blueAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValueOne = newValue!;
                  });
                },
                items: <String>[
                  'BMX',
                  'Cross',
                  'Cruiser',
                  'Hybrid',
                  'Mountain',
                  'Road',
                  'Recumbant'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      controller: _frameSizeTextController,
                      keyboardType: TextInputType.number,
                      focusNode: _focusFrameSize,
                      // obscureText: true,
                      validator: validators[1],
                      decoration: InputDecoration(
                        hintText: "Frame Size",
                        errorBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: DropdownButton<String>(
                      value: dropdownValueTwo,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.blue),
                      underline: Container(
                        height: 2,
                        color: Colors.blueAccent,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValueTwo = newValue!;
                        });
                      },
                      items: <String>['cm', 'in']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: _passcodeTextController,
                // keyboardType: TextInputType.number,
                focusNode: _focusPasscode,
                // obscureText: true,
                validator: validators[3],
                decoration: InputDecoration(
                  hintText: "Bike Lock Combination",
                  errorBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        child: Text('Next'),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // If the form is valid, display a snackbar.
            newBike['frameSize'] = _frameSizeTextController.text;
            newBike['frameUnit'] = dropdownValueTwo;
            newBike['type'] = dropdownValueOne;
            newBike['lockCombination'] = _passcodeTextController.text;
            newBike['ownerID'] = _currentUser.uid;

            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Processing Data')));
            var bikeId = BikesApiService.createBike(newBike).then((value) => {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) =>
                          UploadImage(bike: value, user: _currentUser)))
                });
          }
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
