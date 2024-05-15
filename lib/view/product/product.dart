import 'package:e_commerce/controll/api.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/model/model.dart';
import 'package:e_commerce/view/cartcontroller.dart';
import 'package:e_commerce/view/mycart/mycart.dart';
import 'package:e_commerce/view/product/sizecate.dart';
import 'package:e_commerce/view/crave/carve.dart';
import 'package:e_commerce/colour.dart';
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
      appBar: AppBar(
      backgroundColor:Color(0xffF5F5F5),
        title: Text('Product Details'),
      ),
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
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: CustomClipPath(height: 80),
                  child: Container(
                    height: 350,
                    color: kcontentColor,
                    // child: Image.network(
                    //   product.image,
                    //   height: 200,
                    //   width: double.infinity,
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                ),
                Positioned(child: Image.network(  product.image,
                height: 230,
                width: 400,))
              ],
            ),
            SizedBox(height: 5),
            Text(
              product.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
             SizedBox(height: 5),
            Row(
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
             SizedBox(height: 5),
            Text(
              'Price: \$${product.price}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Description:',
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
                height: 60,
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
    );
  }
}
