import 'dart:io';

import 'package:businessapp/sevices/utility.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/homescreen.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<User?> createUserWithEmailAndPassword(
      String email,
      String password,
      String city,
      String address,
      File? image,
      BuildContext context,
      ) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;
      if (user != null) {
        // Ensure Firestore write operation is successful
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'email': email.trim(),
          'city': city.trim(),
          'address': address.trim(),
          'imagePath': image != null ? image.path : null, // Handling image path
        });
        utility().toastmessage("User created successfully");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => homepage()),
        );
      }

      return user;
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          utility().toastmessage("Email already in use");
        }
      } else {
        utility().toastmessage("An unknown error occurred: ${e.toString()}");
      }

      print("Error: ${e.toString()}"); // Print the error to console for debugging
      return null;
    }
  }

  // Login User with Email and Password
  Future<User?> loginUserWithEmailAndPassword(
      String email,
      String password,
      BuildContext context,
      ) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;
      if (user != null) {
        utility().toastmessage("User logged in successfully");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => homepage()),
        );
      }

      return user;
    } catch (e) {
      // Handling errors
      if (e is FirebaseAuthException) {
        utility().toastmessage("Incorrect email or password");
      } else {
        utility().toastmessage("An unknown error occurred");
      }
      return null;
    }
  }

  // Sign Out
  Future<void> signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      utility().toastmessage("Error signing out");
    }
  }

  // Reset Password
  Future<void> resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      utility().toastmessage("Check your email to reset password");
    } catch (e) {
      if (e is FirebaseAuthException) {
        utility().toastmessage("No user found with this email");
      } else {
        utility().toastmessage("An unknown error occurred");
      }
    }
  }
}
