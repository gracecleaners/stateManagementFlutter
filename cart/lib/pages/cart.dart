import 'package:cart/const.dart';
import 'package:cart/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _buildUI(),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: const Text("Cart"),
    );
  }

  Widget _buildUI() {
    return Consumer<CartProvider>(builder: (context, provider, _) {
      return Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.70,
            child: ListView.builder(
                itemCount: provider.items.length,
                itemBuilder: (context, index) {
                  Products product = provider.items[index];
                  return ListTile(
                    title: Text(product.name),
                    onLongPress: () {
                      provider.remove(product);
                    },
                  );
                }),
          ),
          TextButton(
              onPressed: () {
                provider.removeAll();
              },
              child: const Text("Remove all items from cart")),
          Text("Cart Total: \$${provider.getCartTotal()}")
        ],
      );
    });
  }
}
