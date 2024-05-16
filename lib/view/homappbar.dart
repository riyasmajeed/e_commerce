import 'package:e_commerce/colour.dart';
import 'package:e_commerce/view/categories.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';



class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         homebarIcon(icon: Ionicons.grid_outline),
       
         homebarIcon(icon: Icons.search),
      

        
      ],
    );
  }
}

class homebarIcon extends StatelessWidget {
  final IconData icon;

  const homebarIcon({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 40,
          width: 40,
          color: kcontentColor,
          child: Icon(
            icon,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
    );
  }
}