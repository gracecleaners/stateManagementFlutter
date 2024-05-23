import 'package:flutter/material.dart';

class Products {
  final int id;
  final String name;
  final double price;
  final Color color;

  Products(
      {required this.id,
      required this.name,
      required this.price,
      required this.color});
}

final List<Products> products = [
  Products(id: 0, name: "shoe", price: 200.0, color: Colors.blue),
  Products(id: 1, name: "shirt", price: 50.0, color: Colors.yellow),
  Products(id: 2, name: "trouser", price: 300.0, color: Colors.grey),
  Products(id: 3, name: "skirt", price: 100.0, color: Colors.green),
  Products(id: 4, name: "socks", price: 5.0, color: Colors.black),
  Products(id: 5, name: "jersey", price: 100.0, color: Colors.red),
];
