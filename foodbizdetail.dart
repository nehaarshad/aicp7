import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/Foodcat.dart';

class fooddetail extends StatelessWidget {
  final eat food;
  const fooddetail({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(food.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(food.image),
            SizedBox(height: 20),
            Text(
              food.title,
              style: GoogleFonts.labrada(textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),)
            ),
            SizedBox(height: 10),
            Text(food.location, style: GoogleFonts.labrada(textStyle: TextStyle(fontSize: 16, color: Colors.grey))),
            SizedBox(height: 10),
            Text(
                food.review,
                style: GoogleFonts.labrada(textStyle: TextStyle( fontSize: 14),)
            ),
            SizedBox(height: 10),
            Text(
                food.category,
                style: GoogleFonts.labrada(textStyle: TextStyle( fontSize: 14),)
            ),
            SizedBox(height: 50),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.call),
              label: Text('Call Business'),
            ),
          ],
        ),
      ),
    );
  }
}