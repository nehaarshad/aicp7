import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddBusinessPage extends StatefulWidget {
  @override
  _AddBusinessPageState createState() => _AddBusinessPageState();
}

class _AddBusinessPageState extends State<AddBusinessPage> {
  // Controllers for business fields
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  // File for storing selected image
  File? _image;
  final picker = ImagePicker();

  // Business categories
  String? selectedCategory;
  final List<String> categories = [
    'Desi Food', 'Chinese Food', 'Coffee Shop', 'Sweets', 'Ice Cream',
    'Lab', 'Hospital', 'School', 'University', 'Blood Bank', 'Specialist'
  ];

  // Function to pick an image from gallery
  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Business'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Business Image Upload
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage:  _image != null
                          ? FileImage(_image!) as ImageProvider
                          : null,
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

              // Business Name Field
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Business Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              // Business Location Field
              TextField(
                controller: locationController,
                decoration: InputDecoration(
                  labelText: 'Location',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              // Business Short Description Field
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'Short Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              SizedBox(height: 16),

              // Category Dropdown (Combo Box)
              DropdownButtonFormField<String>(
                value: selectedCategory,
                decoration: InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                ),
                items: categories.map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCategory = newValue;
                  });
                },
              ),
              SizedBox(height: 32),

              // Save Button
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.blueAccent, // Text color
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Button padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Rounded corners
                    ),
                    textStyle: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  onPressed: () {
                    // Collect business information here
                    String businessName = nameController.text;
                    String location = locationController.text;
                    String description = descriptionController.text;
                    String? category = selectedCategory;

                    if (businessName.isEmpty || location.isEmpty || description.isEmpty || category == null || _image == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please fill in all fields and upload an image')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Business added successfully')),
                      );
                    }
                  },
                  child: Text('Add Business'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

