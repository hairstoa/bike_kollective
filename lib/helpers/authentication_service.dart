// ignore_for_file: prefer_const_constructors, await_only_futures

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:bike_kollective/models/user_model.dart';

class AuthenticationService {
  static SnackBar customSnackBar({required String? content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content!,
        style: TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }

  static Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Text('No user found for that email.');
        ScaffoldMessenger.of(context).showSnackBar(
          AuthenticationService.customSnackBar(
            content: 'No user found for that email. Please create an account.',
          ),
        );
      } else if (e.code == 'wrong-password') {
        Text('Wrong password provided.');
        ScaffoldMessenger.of(context).showSnackBar(
          AuthenticationService.customSnackBar(
            content: 'Wrong password provided.',
          ),
        );
      }
    }

    return user;
  }

  static Future<User?> registerUsingEmailPassword({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = userCredential.user;
      await user!.updateDisplayName(name);
      await user.reload();
      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Text('The password provided is too weak.');
        ScaffoldMessenger.of(context).showSnackBar(
          AuthenticationService.customSnackBar(
            content: 'The password provided is too weak.',
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        Text('The account already exists for that email.');
        ScaffoldMessenger.of(context).showSnackBar(
          AuthenticationService.customSnackBar(
            content: 'The account already exists for that email.',
          ),
        );
      }
    }

    return user;
  }

  static Future<User?> refreshUser(User user) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await user.reload();
    User? refreshedUser = auth.currentUser;

    return refreshedUser;
  }
}
