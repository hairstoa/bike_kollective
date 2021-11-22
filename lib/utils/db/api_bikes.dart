import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:cloud_firestore/cloud_firestore.dart';

class BikesApiService {
  // final String documentId;

  // Add a bike
  static Future<void> createBike(body) async {
    CollectionReference bikes = FirebaseFirestore.instance.collection('bikes');

    // Future<void> addBike() {
    // Call the bike's CollectionReference to add a new bike
    return bikes
        .add({
          'available': body['available'],
          'averageStars': 5,
          'checkoutDate': null,
          'condition': body['condition'],
          'description': body['description'],
          'frameSize': body['frameSize'],
          'frameUnit': body['frameUnit'],
          'image': body['image'],
          'location': body['location'],
          'lockCombination': body['lockCombination'],
          'maintenanceRequest': false,
          'missing': false,
          'ownerID': body['ownerID'],
          'ratings': null,
          'renterID': body['renterID'],
          'reportedIssues': body['reportedIssues'],
          'type': body['type']
        })
        .then((value) => print("Bike Added"))
        .catchError((error) => print("Failed to add bike: $error"));
    // }
  }

  // get all Bikes
  static Future<List<dynamic>> getBikes() async {
    // CollectionReference bikes = FirebaseFirestore.instance.collection('bikes');

    return FirebaseFirestore.instance
        .collection('bikes')
        .get()
        .then((QuerySnapshot querySnapshot) {
      return querySnapshot.docs;
      // querySnapshot.docs.forEach((doc) {
      //   print(doc["firstName"]);
      // });
    });
  }

  // get one Bike by id
  //  Future Map<String, dynamic> getBike(bikeId) async {
  //   return FirebaseFirestore.instance
  //       .collection('bikes')
  //       .doc(bikeId)
  //       .get()
  //       .then((DocumentSnapshot documentSnapshot) {
  //         if (documentSnapshot.exists) {
  //           print('Document data: ${documentSnapshot.data()}');
  //           return documentSnapshot.data();
  //         } else {
  //           print('Document does not exist on the database');
  //         }

  //   });
  // }

// Updates one bike where bikeId is the document Id
// updatedBike is an object that does not need to contain all the properties of a bike
  static Future<void> updateBike(bikeId, updatedBike) {
    CollectionReference bikes = FirebaseFirestore.instance.collection('bikes');
    return bikes
        .doc(bikeId)
        .update(updatedBike)
        .then((value) => print("Bike Updated"))
        .catchError((error) => print("Failed to update bike: $error"));
  }

  static Future<void> deleteBike(bikeId) {
    CollectionReference bikes = FirebaseFirestore.instance.collection('bikes');

    return bikes
        .doc(bikeId)
        .delete()
        .then((value) => print("Bike Deleted"))
        .catchError((error) => print("Failed to delete bike: $error"));
  }
}
