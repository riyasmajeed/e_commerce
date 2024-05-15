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
              childAspectRatio: 280 ,
              mainAxisExtent: 280,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 140,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(product.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              product.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Text(
                                  "\$${product.price}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    "\$200",
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: kcontentColor,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: Container(
                        width: 30,
                        height: 30,
                        child: Icon(
                          Icons.favorite,
                          color: const Color.fromARGB(255, 112, 107, 107),
                          size: 28,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      top: 10,
                      child: Container(
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(113, 255, 255, 255),
                        ),
                        child: Center(
                          child: Text(
                            '30%OFF',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
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
