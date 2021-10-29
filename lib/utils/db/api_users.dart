import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:cloud_firestore/cloud_firestore.dart';

class UsersApiService {
  // final String documentId;

  // Add a user
  static Future<void> addUser(body) async {
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

  // get all Users
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

  // get one User by id
  //  Future Map<String, dynamic> getUser(userId) async {
  //   return FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(userId)
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

// Updates one user where userId is the document Id
// updatedUser is an object that does not need to contain all the properties of a user
  static Future<void> updateUser(userId, updatedUser) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return users
        .doc(userId)
        .update(updatedUser)
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  static Future<void> deleteUser(userId) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return users
        .doc(userId)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }
}
