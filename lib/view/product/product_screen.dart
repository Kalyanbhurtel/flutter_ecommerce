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
              child: Column(
                children: [
                  for (int i = 0; i < snapshot.data!.length; i += 2)
                    Row(
                      children: [
                        Expanded(
                          child: ProductCard(product: snapshot.data![i]),
                        ),
                        const SizedBox(width: 8), // Adjust spacing between cards
                        if (i + 1 < snapshot.data!.length)
                          Expanded(
                            child: ProductCard(product: snapshot.data![i + 1]),
                          ),
                      ],
                    ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
