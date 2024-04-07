
import 'package:ecomm/model/product_model.dart';
import 'package:ecomm/view/product/product_details.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Image.network(product.imageUrl ?? ''),
            title: Text(product.name ?? ''),
            subtitle: Text(product.description ?? ''),
            trailing: Text(product.price ?? ''),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Navigate to the product details page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsPage(product: product),
                  ),
                );
              },
              child: const Text('View Product'),
            ),
          ),
        ],
      ),
    );
  }
}
