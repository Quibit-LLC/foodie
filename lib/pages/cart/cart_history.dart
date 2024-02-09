import 'package:flutter/material.dart';
import 'package:foodie/widgets/big_text.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.shopping_cart)
        ],
        title: BigText(text: "Cart History"),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}