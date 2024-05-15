import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/controll/api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class homeslider extends StatefulWidget {
  const homeslider({Key? key}) : super(key: key);

  @override
  State<homeslider> createState() => _homesliderState();
}

class _homesliderState extends State<homeslider> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductController>(context, listen: false).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productController = Provider.of<ProductController>(context);
    return CarouselSlider(
      options: CarouselOptions(
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        autoPlay: false,
        aspectRatio: 2.0, // Aspect ratio to maintain the image's aspect ratio
        viewportFraction: 0.8, // Width of the slider's visible area
        height: 180, // Height of the carousel slider
      ),
      items: productController.products.map((product) {
        return Builder(
          builder: (BuildContext context) {
            return ClipRRect(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              borderRadius: BorderRadius.circular(28),
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.network(
                    product.image,
                    width: 1000, // Width of the image
                    height: 200, // Height of the image
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
