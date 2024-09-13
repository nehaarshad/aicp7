import 'dart:io';
import 'package:businessapp/widgets/buttons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

import '../sevices/authservice.dart';
import 'homescreen.dart';

class signuppage extends StatefulWidget {
  const signuppage({super.key});

  @override
  State<signuppage> createState() => _signuppageState();
}

class _signuppageState extends State<signuppage> {

  final key=GlobalKey<FormState>();
  final AuthService auth=AuthService();
  final TextEditingController name= TextEditingController();
  final TextEditingController pswrd = TextEditingController();
  final TextEditingController repswrd = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController address = TextEditingController();
  final ImagePicker pickimage = ImagePicker();
  File? image;
  bool loading = false;

  Future<void> _pickImage() async {
    final pickedFile = await pickimage.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  signup()async{
    final user=await auth.createUserWithEmailAndPassword(name.text.toString(), pswrd.text.toString(), city.text.trim(),address.text.trim(),image,context);
    if(user!=null){
      setState(() {
        loading=false;
      }
      );

    }
  }

  home(BuildContext context)=>Navigator.push(context, MaterialPageRoute(builder: (context)=>homepage()));
  @override
  void dispose() {
    super.dispose();
    name.dispose();
    pswrd.dispose();
    city.dispose();
    repswrd.dispose();
    address.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 110),
          child: Form(
            key: key,
            child: Column(
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: image == null
                      ? Container(
                    height: 120,
                    width: 120,
                    color: Colors.grey.shade400.withOpacity(0.9),
                    child: Icon(Icons.add_a_photo, size: 30),
                  )
                      : Image.file(
                    image!,
                    height: 120,
                    width: 120,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: name,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: pswrd,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: repswrd,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Re-enter Password'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please re-enter your password';
                    }
                    if (value != pswrd.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: city,
                  decoration: InputDecoration(labelText: 'City'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your city';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: address,
                  decoration: InputDecoration(labelText: 'Address'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24),
                buttons(text: "SignUp",loading: loading, ontap: ()async{
                  setState(() {
                    loading=true;
                  });
                    await signup();
                  setState(() {
                    loading = false;
                  });
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
