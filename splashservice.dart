import 'dart:async';
import 'package:flutter/material.dart';
import '../screens/loginscreen.dart';

class services {

  void islogin(BuildContext context) {
    Timer( Duration(seconds: 4), () =>
        Navigator.push(context, MaterialPageRoute(builder: (context) => login()))
    );
  }
}