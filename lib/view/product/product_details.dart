import 'package:ecomm/model/product_model.dart';
import 'package:ecomm/view/cart/cart.dart';
import 'package:ecomm/view/register/register.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // Calculate total amount after discount
    double totalAmount = double.parse(product.price ?? '0');
    double discountAmount = double.parse(product.discount ?? '0');
    totalAmount -= discountAmount;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display Product Image
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(product.imageUrl ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16), // Add spacing
            // Display Product Details
            Text(
              product.name ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text('Description: ${product.description ?? ''}'),
            Text('Price: ${product.price ?? ''}'),
            Text('Total Stock: ${product.stock ?? ''}'),
            if (product.discount != null && product.discount!.isNotEmpty)
              Text('Discount Amount: ${product.discount}'),
            Text('Total Amount: $totalAmount'),
            const SizedBox(height: 16), // Add spacing
            // Add to Cart Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Check if user is logged in
                  bool isLoggedIn = false; // Replace this with your actual logic to check if user is logged in

                  // ignore: dead_code
                  if (isLoggedIn) {
                    // User is logged in, navigate to CartPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CartPage()),
                    );
                  } else {
                    // User is not logged in, navigate to LoginPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegisterScreen()),
                    );
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 25, 17, 17)),
                  shape: MaterialStateProperty.all<OutlinedBorder>(const RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                ),
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
