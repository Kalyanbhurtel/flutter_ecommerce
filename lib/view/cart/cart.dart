import 'package:flutter/material.dart';
import 'package:ecomm/model/product_model.dart';

class CartPage extends StatelessWidget {
  final Product product;

  const CartPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Product Name: ${product.name ?? ''}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Price: ${product.price ?? ''}'),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
