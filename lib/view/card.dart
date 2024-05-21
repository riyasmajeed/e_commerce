import 'package:e_commerce/colour.dart';
import 'package:e_commerce/controll/api.dart';

import 'package:e_commerce/view/product/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductController>(context, listen: false).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductController>(
      builder: (context, productController, child) {
        if (productController.products.isEmpty) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return SizedBox(
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 300,
              mainAxisExtent: 330,
            ),
            itemCount:4,
            itemBuilder: (context, index) {
              final product = productController.products[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductScreen(productId: product.id),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    Container(
                    
                      decoration: BoxDecoration(
                        color: kcontentColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [ 
                           Padding(
                             padding: const EdgeInsets.all(15),
                             child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             
                              children: [
                                 Container(
                                  height: 30,
                                  width: 65,
                                   child: TextButton(
                                    
                                   style: TextButton.styleFrom(
                                                                 
                                   
                                           backgroundColor: Colors.white,
                                         ),
                                                 onPressed: () {},
                                                 child: Text(
                                                                '30%OFF',
                                                               style: TextStyle(color: Colors.black, fontSize: 10),
                                                             ),
                                               ),
                                 ),
                                
                              Container(
                                                     width: 30,
                                                     height: 30,
                                                     child: Icon(
                                                       Icons.favorite,
                                                        color: Color.fromARGB(130, 122, 118, 118),
                                                       size: 22,
                                                     ),
                                                   ),
                             
                              ],
                             ),
                           ),


                          Container(
                            height: 120,
                            
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(product.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(10),
                          //   child: Text(
                          //     product.title,
                          //     style: const TextStyle(
                          //       fontWeight: FontWeight.bold,
                          //       fontSize: 16,
                          //     ),
                          //   ),
                          // ),
                          Padding(
                            padding: const EdgeInsets.only( left: 10,right: 10,bottom: 10,top: 25),
                            child: Container(
                              
                              width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
                              color: Colors.white
                            ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      
                                  product.title,
                                  style: const TextStyle(
                                  color: Color.fromARGB(255, 122, 118, 118),
                                    fontSize: 15,
                                  ),
                                ),
                                
                                Row(
                                
                                  children: [ Text(
                                      "\$${product.price}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                        color: Colors.black
                                      ),
                                    ), 
                                     Text(
                                       "\$200",
                                       style: const TextStyle(
                                         fontSize: 15,
                                         color: Color.fromARGB(255, 122, 118, 118),
                                         decoration: TextDecoration.lineThrough,
                                       ),
                                     ),
                                
                                
                                  ],
                                )
                                   
                                    // const SizedBox(width: 5),
                                  
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Positioned(
                    //   right: 10,
                    //   top: 10,
                    //   child: 
                    //   Container(
                    //     width: 30,
                    //     height: 30,
                    //     child: Icon(
                    //       Icons.favorite,
                    //       color: const Color.fromARGB(255, 112, 107, 107),
                    //       size: 28,
                    //     ),
                    //   ),
                    // ),
                    // Positioned(
                    //   left: 10,
                    //   top: 10,
                    //   child: Container(
                    //     width: 80,
                    //     height: 30,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(15),
                    //       color: const Color.fromARGB(113, 255, 255, 255),
                    //     ),
                    //     child: Center(
                    //       child: Text(
                    //         '30%OFF',
                    //         style: TextStyle(color: Colors.black, fontSize: 20),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
