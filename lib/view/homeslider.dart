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
        aspectRatio: 4.1, // Aspect ratio to maintain the image's aspect ratio
        viewportFraction: 1.0, // Width of the slider's visible area
        height: 160, // Height of the carousel slider
        
      ),
      items: productController.products.map((product) {
        return Builder(
          builder: (BuildContext context) {
            return ClipRRect(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  // Image.network(
                  //   product.image,
                  //   width: 1000, // Width of the image
                  //   height: 200, // Height of the image
                  //   fit: BoxFit.cover,
                  // ),
                  Container(
                    height: 100,
                    width:100,
                    decoration: BoxDecoration(
borderRadius: BorderRadius.circular(17),
color: Colors.deepOrange

                    ),
                    child: Padding(
                      padding:  EdgeInsets.only(left: 25,top: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      
                        Text('30% OFF DURING ',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                         Text('COVID 19',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),

                         SizedBox(height: 10,),

                         Container(
                          height: 35,
                          width: 85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white
                          ),
                          child: Center(
                            child: Text('Get Now',style:TextStyle(color: const Color.fromARGB(255, 249, 106, 63),fontSize: 15,fontWeight: FontWeight.bold) ,),
                          ),
                         )
                      ],
                      
                      ),
                    ),
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
