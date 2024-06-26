import 'package:e_commerce/view/card.dart';
import 'package:e_commerce/view/homappbar.dart';
import 'package:e_commerce/view/homeslider.dart';
import 'package:e_commerce/view/mainhome.dart';
import 'package:e_commerce/view/mycart/mycart.dart';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 2;
  List<Widget> screens = [
    Scaffold(body: Center(child: Text('Screen 1'))),
    Scaffold(body: Center(child: Text('Screen 2'))),
    mainHomeScreen(),
     CartScreen(),
    Scaffold(body: Center(child: Text('Screen 5'))),
   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
       
          Expanded(child: screens[currentTab]),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        height: 70,
        color: Colors.white,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 38,
              width: 95,
              decoration: BoxDecoration(
                  color:currentTab == 2 ? Color.fromARGB(30, 255, 86, 34) : Color.fromARGB(90, 189, 189, 189) ,
                  borderRadius: BorderRadius.circular(15)),
              child: InkWell(
                onTap: () => setState(() {
                         currentTab = 2;
                      }) ,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.home,
                    color:currentTab == 2 ? Colors.deepOrange : Colors.grey.shade400 ,),
                    // IconButton(
                    //   onPressed: () => setState(() {
                    //     currentTab = 2;
                    //   }),
                    //   icon: Icon(
                    //     Icons.home,
                    //     color: currentTab == 2 ? Colors.deepOrange : Colors.grey.shade400,
                    //   ),
                    // ),
                    SizedBox(width: 3,),
                    Text('Home',style: TextStyle(
                      fontSize: 13,fontWeight: FontWeight.bold,
                      color:currentTab == 2 ? Colors.deepOrange : Colors.grey.shade400 
                    ),)
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () => setState(() {
                currentTab = 1;
              }),
              icon: Icon(
                Icons.grid_view,
                color: currentTab == 1 ? Colors.deepOrange : Colors.grey.shade400,
              ),
            ),
            IconButton(
              onPressed: () => setState(() {
                currentTab = 3;
              }),
              icon: Icon(
                Icons.favorite,
                color: currentTab == 3 ? Colors.deepOrange : Colors.grey.shade400,
              ),
            ),
            IconButton(
              onPressed: () => setState(() {
                currentTab = 3;
              }),
              icon: Icon(
                Icons.shopping_cart,
                color: currentTab == 3? Colors.deepOrange : Colors.grey.shade400,
              ),
            ),
            IconButton(
              onPressed: () => setState(() {
                currentTab = 4;
              }),
              icon: Icon(
                Icons.person,
                color: currentTab == 4 ? Colors.deepOrange : Colors.grey.shade400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
