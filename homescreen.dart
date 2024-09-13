import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'addbizpage.dart';
import 'editprofile.dart';
import 'education.dart';
import 'foods.dart';
import 'health.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  Widget _buildCategoryItem(String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap, // Tap action
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.blueAccent.withOpacity(0.8),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 30),
            SizedBox(width: 20),
            Text(
              title,
              style: GoogleFonts.labrada(
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '   Business Categories',
              style: GoogleFonts.lato(
                textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              // Navigate to the edit page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => editpage()), // Replace with your EditPage class
              );
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle, // Makes the container circular
                image: DecorationImage(
                  image: AssetImage('assets/images/girl.png'), // Path to your edit image
                  fit: BoxFit.cover, // Fit the image inside the container
                ),
              ),
              height: 50,
              width: 50,
            ),
          ),
        ],
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              SizedBox(height: 40),
              _buildCategoryItem('Food', Icons.fastfood, () => Navigator.push(context, MaterialPageRoute(builder: (context) => Foods()))),
              SizedBox(height: 25),
              _buildCategoryItem('Education', Icons.school, () => Navigator.push(context, MaterialPageRoute(builder: (context) => inst()))),
              SizedBox(height: 25),
              _buildCategoryItem('Healthcare', Icons.health_and_safety, () => Navigator.push(context, MaterialPageRoute(builder: (context) => hospitals()))),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),

      // Floating Action Button for "Add Your Own Business"
      floatingActionButton: FloatingActionButton.extended(
backgroundColor: Colors.redAccent.withOpacity(0.5),
        onPressed: () {
          // Navigate to Add Business page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddBusinessPage()), // Replace with your AddBusinessPage class
          );
        },
        icon: Icon(Icons.add_business,color: Colors.white,size: 22,),
        label: Text('Add Your Own Business',style: GoogleFonts.lato(textStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18)),),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, // Centered at the bottom
    );
  }
}
