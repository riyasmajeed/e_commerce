import 'package:e_commerce/colour.dart';
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
        title: Text('Cart'),
      ),
      body: Consumer<CartController>(
        builder: (context, cartController, child) {
          return ListView.builder(
            itemCount: cartController.cartItems.length,
            itemBuilder: (context, index) {
              final product = cartController.cartItems[index];
              return ListTile(
                title: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color.fromARGB(51, 202, 197, 197),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: 60,
                        width: 50,
                        child: Image.network(product.product.image),
                        decoration: BoxDecoration(),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 200,
                            child: Text(product.product.title),
                          ),
                          Text('\$${product.product.price}'),
                        ],
                      ),
                      // SizedBox(width: 20),
                      Row(
                        
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        
                          IconButton(
                          
                            onPressed: () {
                              cartController.addToCart(product.product);
                            },
                            icon: Icon(Icons.add),
                          ),
                          Text('${product.quantity}'),
                          IconButton(
                            onPressed: () {
                              cartController.removeFromCart(product.product);
                            },
                            icon: Icon(Icons.remove),
                          ),
                        ],
                      ),
                      
                    ],
                  ),
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
