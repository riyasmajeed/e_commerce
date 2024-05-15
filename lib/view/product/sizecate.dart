import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class SizeCategory extends StatelessWidget {
  const SizeCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              CategoryIcon( text: '35'),
              CategoryIcon(text: '36'),
              CategoryIcon(text: '37'),
              CategoryIcon(text: '38'),
              CategoryIcon(text: '40'),
              CategoryIcon(text: '41'),
              CategoryIcon(text: '42'),
              CategoryIcon(text: '43'),
             
            
            ],
          ),
        ),
      ],
    );
  }
}

class CategoryIcon extends StatelessWidget {
 
  final String? text;

  const CategoryIcon({Key? key,  this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 50,
          width: 50,
          color: Color.fromARGB(80, 210, 170, 107),
          child: Center(
            child: 
                Text(
                    text!,
                    style: TextStyle(
                      color: Color.fromARGB(255, 3, 2, 2),
                    ),
                  )
                
          ),
        ),
      ),
    );
  }
}
