import 'package:businessapp/screens/foodbizdetail.dart';
import 'package:flutter/material.dart';

import '../models/Foodcat.dart';

class foodlist extends StatefulWidget {
  final eat food;
  const foodlist({super.key,required this.food});

  @override
  State<foodlist> createState() => _foodlistState();
}

class _foodlistState extends State<foodlist> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>fooddetail(food: widget.food,)));
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
                    widget.food.image,
                    width: double.infinity,
                    height: 80.5,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 6,),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(widget.food.title,style: TextStyle(
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
