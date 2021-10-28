import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:cloud_firestore/cloud_firestore.dart';

class UsersApiService {
  // final String documentId;

  static Future<List<dynamic>> getUsers() async {
    // CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      return querySnapshot.docs;
      // querySnapshot.docs.forEach((doc) {
      //   print(doc["firstName"]);
      // });
    });
  }

  static Future<void> addUser(body) async {
    // body = {"firstName": "Dwight", "lastName": "Schrute"};
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    // Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'firstName': body['firstName'],
          'lastName': body['lastName'],
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
    // }
  }

  // @override
  // Widget build(BuildContext context) {
  //   CollectionReference users = FirebaseFirestore.instance.collection('users');

  //   return FutureBuilder<DocumentSnapshot>(
  //     future: users.doc(documentId).get(),
  //     builder:
  //         (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
  //       if (snapshot.hasError) {
  //         return Text("Something went wrong");
  //       }

  //       if (snapshot.hasData && !snapshot.data!.exists) {
  //         return Text("Document does not exist");
  //       }

  //       if (snapshot.connectionState == ConnectionState.done) {
  //         Map<String, dynamic> data =
  //             snapshot.data!.data() as Map<String, dynamic>;
  //         return Text("Full Name: ${data['firstName']} ${data['lastName']}");
  //       }

  //       return Text("loading");
  //     },
  //   );
  // }
}
