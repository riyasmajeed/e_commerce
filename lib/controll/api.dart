import 'package:e_commerce/model/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductController extends ChangeNotifier {
  List<Product> _products = [];

  ProductController() : super() {
    fetchProducts();
  }

  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    const apiUrl = 'https://fakestoreapi.com/products';
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      _products = list.map((model) => Product.fromJson(model)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<Product> fetchProduct(int productId) async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products/$productId'));

    if (response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load product');
    }
  }
}
