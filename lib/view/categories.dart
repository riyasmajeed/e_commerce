


import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Top Categories',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'SEE ALL',
                style: TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              CategoryIcon(icon: Ionicons.watch),
              CategoryIcon(icon: Ionicons.footsteps),
              CategoryIcon(icon: Ionicons.pizza_outline),
              CategoryIcon(icon: Ionicons.ice_cream_outline),
              CategoryIcon(icon: Ionicons.restaurant_outline),
              CategoryIcon(icon: Ionicons.wine_outline),
                 CategoryIcon(icon: Ionicons.footsteps),
                    CategoryIcon(icon: Ionicons.watch),
            ],
          ),
        ),
      ],
    );
  }
}

class CategoryIcon extends StatelessWidget {
  final IconData icon;

  const CategoryIcon({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 50,
          width: 50,
          color: Colors.orange,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}