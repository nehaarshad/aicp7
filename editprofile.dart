import 'package:businessapp/sevices/authservice.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'loginscreen.dart';

class editpage extends StatefulWidget {
  @override
  _editpageState createState() => _editpageState();
}

class _editpageState extends State<editpage> {
  AuthService auth=AuthService();
  TextEditingController nameController = TextEditingController(text: "Neha Arshad");
  TextEditingController emailController = TextEditingController(text: "new123@gmail.com");
  TextEditingController phoneController = TextEditingController(text: "+123456789");
  TextEditingController locationController = TextEditingController(text: "New York, USA");
  TextEditingController passwordController = TextEditingController(text: "*********");

  File? _image; // Variable to hold selected image
  final picker = ImagePicker();

  // Function to pick image from gallery
  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              auth.signOut();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Image
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: _image == null
                          ? AssetImage('assets/images/girl.png') // Placeholder image
                          : FileImage(_image!) as ImageProvider,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                        icon: Icon(Icons.camera_alt, color: Colors.white, size: 30),
                        onPressed: _pickImage, // Pick image from gallery
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),

              // Name Field
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              // Email Field
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),

              // Phone Field
              TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 16),

              // Location Field
              TextField(
                controller: locationController,
                decoration: InputDecoration(
                  labelText: 'Location',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              // Password Field
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true, // To hide the password text
              ),
              SizedBox(height: 32),

              // Save Button
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent.withOpacity(0.8), // Set background color to blueAccent
                  ),
                  onPressed: () {

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Profile updated successfully')),
                    );
                  },
                  child: Text('Save Changes',style: GoogleFonts.lato(textStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18)),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

