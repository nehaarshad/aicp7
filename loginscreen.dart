import 'package:businessapp/screens/signupscreen.dart';
import 'package:flutter/material.dart';
import '../sevices/authservice.dart';
import '../sevices/utility.dart';
import '../widgets/buttons.dart';
import 'homescreen.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  final TextEditingController username=TextEditingController();
  final TextEditingController password=TextEditingController();
  final TextEditingController resetEmailController = TextEditingController();
  bool show=true;

  void _showResetPasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Reset Password'),
          content: TextField(
            controller: resetEmailController,
            decoration: InputDecoration(
              labelText: 'Enter your email',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Call the reset password method
                if (resetEmailController.text.isNotEmpty) {
                  _resetPassword(resetEmailController.text);
                  Navigator.of(context).pop(); // Close dialog after reset
                } else {
                  // Show a message to enter email
                  utility().toastmessage("Please enter your email");
                }
              },
              child: Text('Reset'),
            ),
          ],
        );
      },
    );
  }

  // Method to reset the password
  void _resetPassword(String email) {
    AuthService().resetPassword(email);
    utility().toastmessage("Password reset email sent to $email");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 50,horizontal: 40),
          child: Column(
            children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(55, 40,25, 5),
                      child: Container(
                        height: 200,
                       width: 200,
                       decoration: BoxDecoration(
                         image: DecorationImage(
                           image: AssetImage("assets/images/login.jpeg"),
                           fit: BoxFit.fill
                         )
                       ),
                      ),
                    ),
              SizedBox(height: 50),
              TextField(
                controller: username,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: password,
                obscureText: show,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      show ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        show = !show;
                      });
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(onPressed: (){

                }, child: Text("Forget password?",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black,

                ),)),
              ),
              SizedBox(height: 20),
          buttons(text: "Login", ontap: (){ Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => homepage()));
          }),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>signuppage()));
                  }, child: Text("SignUP",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black,

                  ),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
