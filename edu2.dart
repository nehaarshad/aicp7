import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/education.dart';


class edud extends StatelessWidget {
  final edu educ;
  const edud({super.key, required this.educ});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(educ.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(educ.image),
            SizedBox(height: 20),
            Text(
                educ.title,
                style: GoogleFonts.labrada(textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),)
            ),
            SizedBox(height: 10),
            Text(educ.location, style: GoogleFonts.labrada(textStyle: TextStyle(fontSize: 16, color: Colors.grey))),
            SizedBox(height: 10),
            Text(
                educ.review,
                style: GoogleFonts.labrada(textStyle: TextStyle( fontSize: 14),)
            ),
            SizedBox(height: 10),
            Text(
                educ.category,
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