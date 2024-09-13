import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/healthcare.dart';

class h2 extends StatelessWidget {
  final health h;
  const h2({super.key, required this.h});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(h.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(h.image),
            SizedBox(height: 20),
            Text(
                h.title,
                style: GoogleFonts.labrada(textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),)
            ),
            SizedBox(height: 10),
            Text(h.location, style: GoogleFonts.labrada(textStyle: TextStyle(fontSize: 16, color: Colors.grey))),
            SizedBox(height: 10),
            Text(
               h.review,
                style: GoogleFonts.labrada(textStyle: TextStyle( fontSize: 14),)
            ),
            SizedBox(height: 10),
            Text(
              h.category,
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