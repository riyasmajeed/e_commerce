import 'package:e_commerce/controll/api.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/model/model.dart';
import 'package:e_commerce/view/cartcontroller.dart';
import 'package:e_commerce/view/mycart/mycart.dart';
import 'package:e_commerce/view/product/sizecate.dart';
import 'package:e_commerce/view/crave/carve.dart';
import 'package:e_commerce/colour.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  final int productId;
  const ProductScreen({Key? key, required this.productId}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late Future<Product> _productFuture;
  final ProductController _productController = ProductController();

  @override
  void initState() {
    super.initState();
    _fetchProduct();
  }

  void _fetchProduct() {
    _productFuture = _productController.fetchProduct(widget.productId);
  }

  void _addToCart(BuildContext context, Product product) {
    Provider.of<CartController>(context, listen: false).addToCart(product);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.title} added to cart'),
        duration: Duration(seconds: 2),
        action: SnackBarAction(
          label: 'View Cart',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartScreen()),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Product>(
        future: _productFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return ProductDetails(
              product: snapshot.data!,
              onAddToCart: () => _addToCart(context, snapshot.data!),
            );
          }
        },
      ),
    );
  }
}

class ProductDetails extends StatelessWidget {
  final Product product;
  final VoidCallback onAddToCart;

  const ProductDetails({
    Key? key,
    required this.product,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(

        children: [

          ClipPath(
            clipper: CustomClipPath(height: 30),
            child: Container(
              height: 450,
              color: kcontentColor,
            ),
          ),

          Positioned(
            left: 10,
            top: 10,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,size:28 ,
             color: Colors.black,
              ),
              onPressed: () {
               Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: 300,
            left: 190,
            child:Container(
              height: 10,
              width: 10,
             
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white
               
              ),
            )
             ),
             Positioned(
            top: 300,
            left: 205,
            child:Container(
              height: 10,
              width: 10,
             
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.deepOrange
               
              ),
            )
             ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20,bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   
                    SizedBox(height: 360),
                    Text(
                      product.title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.star_rate, color: Colors.yellow),
                        Icon(Icons.star_rate, color: Colors.yellow),
                        Icon(Icons.star_rate, color: Colors.yellow),
                        Icon(Icons.star_rate, color: Colors.yellow),
                        Icon(Icons.star_rate, color: Colors.yellow),
                        SizedBox(width: 15),
                        Text('(4500 Reviews)'),

                      ],
                    ),
                    SizedBox(height: 25),
                    Row(
                      children: [
                        Text(
                          '\$${product.price}',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 5,),
                        Text(
                                       "\$200",
                                       style: const TextStyle(
                                         fontSize: 15,
                                         color: Color.fromARGB(255, 122, 118, 118),
                                         decoration: TextDecoration.lineThrough,
                                       ),
                                     ),
  Spacer(),
                                     Text('Avaliable in stock',style: TextStyle(
                                      fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black
                                     ),)
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      'About',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      product.description,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 16),
                    SizeCategory(),
                    SizedBox(height: 16),
                    GestureDetector(
                      onTap: onAddToCart,
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.deepOrange,
                        ),
                        child: Center(
                          child: Text(
                            'Add to cart',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Image.network(
              product.image,
              height: 240,
              width: 400,
            ),
          ),
        ],
      ),
    );
  }
}
