import 'package:businessapp/screens/h2.dart';
import 'package:flutter/material.dart';

import '../models/healthcare.dart';

class hlist extends StatefulWidget {
  final health h;
  const hlist({super.key,required this.h});

  @override
  State<hlist> createState() => _hlistState();
}

class _hlistState extends State<hlist> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>h2(h:  widget.h,)));
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
                    widget.h.image,
                    width: double.infinity,
                    height: 80.5,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 6,),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(widget.h.title,style: TextStyle(
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
