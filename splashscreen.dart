import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../sevices/splashservice.dart';

class spalshscreen extends StatefulWidget {
  const spalshscreen({super.key});

  @override
  State<spalshscreen> createState() => _spalshscreenState();
}

class _spalshscreenState extends State<spalshscreen> {
  services ss=services();

  @override
  void initState(){
    super.initState();
    ss.islogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/R.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 290,horizontal: 70.5),
            child: Container(
              height: 130,
              width: 220,
              decoration: BoxDecoration(
                color: Colors.yellow.shade100.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
                border: Border.symmetric(
                  vertical: BorderSide(
                    color: Colors.black26, // Color of the border
                    width: 3.0,          // Width of the border
                  ),
                  horizontal: BorderSide(
                    color: Colors.black26,
                    width: 3.0,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(4, 4),
                  ),
                ],
              ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 20.0),
                  child: Column(
                    children: [
                      Text("Business App",style: GoogleFonts.lato(textStyle:TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)),
                      SizedBox(height: 7,),
                      Text("Save Your Future!",style: GoogleFonts.lato(textStyle: TextStyle(fontWeight: FontWeight.w800,fontSize: 20,color: Colors.black12.withOpacity(0.5)),)),
                  ]
                  ),
                )

            ),
          )
        ],
      ),
    );
  }
}
