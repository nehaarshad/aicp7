import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class buttons extends StatelessWidget {
  final String text;
  final bool loading;
  final VoidCallback ontap;
  const buttons({super.key,required this.text,required this.ontap,this.loading=false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: loading? CircularProgressIndicator(strokeWidth: 2,color: Colors.white,):Text(text,style:GoogleFonts.lato(textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20
          ),),
          ), )

      ),
    );
  }
}