import 'package:cart/const.dart';
import 'package:cart/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _buildUI(context),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: const Text("Products"),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/cart");
            },
            icon: const Icon(Icons.shopping_cart))
      ],
    );
  }

  Widget _buildUI(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        Products product = products[index];
        return ListTile(
          leading: Container(
            width: 25,
            height: 25,
            color: product.color,
          ),
          title: Text(product.name),
          trailing: Checkbox(
            value: cartProvider.items.contains(product),
            onChanged: (value) {
              if (value == true) {
                cartProvider.add(product);
              } else {
                cartProvider.remove(product);
              }
            },
          ),
        );
      },
    );
  }
}
