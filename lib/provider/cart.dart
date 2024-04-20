import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem>? _items = {};

  Map<String, CartItem> get items {
    return {..._items!};
  }

  int get itemCount {
    return _items == null ? 0 : _items!.length;
  }

  double get totalAmount {
    double total = 0;

    _items!.forEach((key, cartItem) {
      total += (cartItem.price * cartItem.quantity) as double;
    });

    return total;
  }

  void addItem(String productId, double price, String title) {
    //check existing same product
    if (_items!.containsKey(productId)) {
      //change quantity
      //existing cart item is automatically generate from _items class
      _items!.update(
        productId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          quantity: existingCartItem.quantity + 1,
          price: existingCartItem.price,
        ),
      );
    } else {
      _items!.putIfAbsent(
        productId,
        () => CartItem(
            id: DateTime.now().toString(),
            title: title,
            quantity: 1,
            price: price),
      );
    }
    notifyListeners();
  }
}
