import 'package:businessapp/models/Foodcat.dart';
import 'package:flutter/material.dart';

import '../widgets/searchbar.dart';
import 'foodbizdetail.dart';
class Foods extends StatefulWidget {
  const Foods({super.key});

  @override
  State<Foods> createState() => _FoodsState();
}

class _FoodsState extends State<Foods> {
  int selected = 0;
  List<List<eat>> select = [eats, popular,Ice, fast, sweet, chinese, desi];

  // Filter categories
  final List<String> foodCategories = ["All","Popular Restaurants", "Ice Creams","Fast Food", "Sweets", "Chinese","Desi Foods"];

  // Update selected category
  void filterByCategory(int index) {
    setState(() {
      selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 56, horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  // Filter button
                  IconButton(
                    icon: Icon(Icons.filter_alt,size: 30,),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 200,
                            child: ListView.builder(
                              itemCount: foodCategories.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(foodCategories[index]),
                                  onTap: () {
                                    filterByCategory(index);
                                    Navigator.pop(context);
                                  },
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                  Expanded(child: searchbar()),
                ],
              ),
              SizedBox(height: 20),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.78,
                ),
                itemCount: select[selected].length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => fooddetail(food: select[selected][index]),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.blueAccent.withOpacity(0.2),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 35, width: double.infinity),
                              Center(
                                child: Image.asset(
                                  select[selected][index].image,
                                  width: double.infinity,
                                  height: 80.5,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(height: 6),
                              Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Text(
                                  select[selected][index].title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}