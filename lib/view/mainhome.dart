import 'package:e_commerce/colour.dart';
import 'package:e_commerce/controll/api.dart';
import 'package:e_commerce/view/card.dart';
import 'package:e_commerce/view/categories.dart';
import 'package:e_commerce/view/homappbar.dart';
import 'package:e_commerce/view/homeslider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class mainHomeScreen extends StatefulWidget {
  const mainHomeScreen({Key? key}) : super(key: key);

  @override
  State<mainHomeScreen> createState() => mainHomeScreenState();
}

class mainHomeScreenState extends State<mainHomeScreen> {
 
 
  @override
  Widget build(BuildContext context) {
    
//     MediaQuery.of(context).size.width; //to get the width of screen
// MediaQuery.of(context).size.height; //to get height of screen
     
    return Scaffold(
       
      backgroundColor: kscaffoldColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeAppBar(),
                   SizedBox(height: 30),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello Rocky ",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Let's get some things? ",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 125, 120, 120),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                homeslider(),
                SizedBox(height: 20),
                Categories(),
                SizedBox(height: 20),
                CardScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
