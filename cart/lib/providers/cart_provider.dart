import 'package:cart/const.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Products> _items = [];

  List<Products> get items => _items;

  // adding items to the list
  void add(Products item) {
    _items.add(item);
    notifyListeners();
  }

  // remove an item from the list
  void remove(Products item) {
    _items.remove(item);
    notifyListeners();
  }

  // remove all items from the list
  void removeAll() {
    _items.clear();
    notifyListeners();
  }

  // get the total price for the cart
  double getCartTotal() {
    return _items.fold(
        0, (previousValue, item) => previousValue + item.price);
  }
}
