import 'package:flutter/material.dart';

class searchbar extends StatefulWidget {
  const searchbar({super.key});

  @override
  State<searchbar> createState() => _searchbarState();
}

class _searchbarState extends State<searchbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(35)
      ),
      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 8),
      child: Row(
        children: [
          Icon(Icons.search,color: Colors.black,size: 23,),
          SizedBox(width: 20,),
          Flexible(
              flex: 5,
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Search....",
                    border: InputBorder.none
                ),
              )
          ),
        ],
      ),
    );
  }
}