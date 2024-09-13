import 'package:businessapp/screens/edu2.dart';
import 'package:flutter/material.dart';

import '../models/education.dart';

class edulist extends StatefulWidget {
  final edu educ;
  const edulist({super.key,required this.educ});

  @override
  State<edulist> createState() => _edulistState();
}

class _edulistState extends State<edulist> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>edud(educ:  widget.educ,)));
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 35,
                  width: double.infinity,),
                Center(
                  child:  Image.asset(
                    widget.educ.image,
                    width: double.infinity,
                    height: 80.5,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 6,),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(widget.educ.title,style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 15
                  ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
