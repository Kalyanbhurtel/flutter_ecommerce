import 'package:ecomm/controller/product_controller.dart';
import 'package:ecomm/model/product_model.dart';
import 'package:ecomm/view/product/product_card.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: FutureBuilder(
        future: ProductController().getProducts(),
        builder: (context, AsyncSnapshot<List<Product>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: snapshot.data!.map((product) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 12.0, // Adjust width as needed
                    child: ProductCard(product: product),
                  );
                }).toList(),
              ),
            );
          }
        },
      ),
    );
  }
}
