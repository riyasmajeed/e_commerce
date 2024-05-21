import 'package:e_commerce/colour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/model/model.dart';
import 'package:e_commerce/view/cartcontroller.dart';
import 'package:e_commerce/view/mycart/checkoutbox.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(' My Cart',style: TextStyle(
          fontWeight: FontWeight.bold,fontSize: 20
        ),),
      ),
      body: Consumer<CartController>(
        builder: (context, cartController, child) {
          return ListView.builder(
            itemCount: cartController.cartItems.length,
            itemBuilder: (context, index) {
              final product = cartController.cartItems[index];
              return ListTile(
                title: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(51, 202, 197, 197),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20,top: 15,bottom: 15,left: 10),
                            child: Container(
                                height: 120,
                                  width: 95,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(46, 221, 12, 12),
                                    borderRadius: BorderRadius.circular(18)
                                  ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  height: 200,
                                  width: 30,
                                  child: Image.network(product.product.image),
                                  decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(18)
                                  ),
                                ),
                              ),
                            ),
                          ),
                          
                          // SizedBox(width: 20),
                          
                        ],
                      ),
                      
                    ),
                   
                     Positioned(
                       child: Padding(
                         padding: const EdgeInsets.only(top: 25,left: 120,right: 15),
                         child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(product.product.title,style: TextStyle(fontWeight: FontWeight.bold),),
                              Text('\$${product.product.price}' ,style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                          color: Colors.black
                                        ),),
                              
                              
                       
                             
                            ],
                          ),
                       ),
                     ),
                     
                    Positioned(
                      right: 15,
                      bottom: 33,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25, top: 10, right: 10),
                        child: Container(
                          height: 35,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10), color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              
                              InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  cartController.removeFromCart(product.product);
                                },
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.orange,
                                  size: 20,
                                ),
                              ),
                              Text(
                                '${product.quantity}',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                             InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  cartController.addToCart(product.product);
                                },
                                child: Icon(
                                  Icons.add,
                                  color: Colors.orange,
                                   size: 20
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
      bottomSheet: CheckOutBox(items: Provider.of<CartController>(context).cartItems),
    );
  }
}
