import 'package:e_commerce/model/model.dart';
import 'package:flutter/material.dart';

class CartController extends ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(Product product) {
    // Check if the product already exists in the cart
    bool productExists = false;
    for (CartItem item in _cartItems) {
      if (item.product.id == product.id) {
        item.quantity++;
        productExists = true;
        break;
      }
    }

    // If the product is not in the cart, add it as a new item
    if (!productExists) {
      _cartItems.add(CartItem(quantity: 1, product: product));
    }

    notifyListeners();
  }

  void removeFromCart(Product product) {
    for (CartItem item in _cartItems) {
      if (item.product.id == product.id) {
        if (item.quantity > 1) {
          item.quantity--;
        } else {
          _cartItems.remove(item);
        }
        break;
      }
    }
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}

class CartItem {
  int quantity;
  Product product;

  CartItem({
    required this.quantity,
    required this.product,
  });
}
