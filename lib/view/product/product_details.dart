import 'package:ecomm/controller/login_controller.dart';
import 'package:ecomm/model/product_model.dart';
import 'package:ecomm/view/cart/cart.dart';
import 'package:ecomm/view/login/AuthService/auth_service.dart';
import 'package:ecomm/view/login/login_page.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    double totalAmount = double.parse(product.price ?? '0');
    double discountAmount = double.parse(product.discount ?? '0');
    totalAmount -= discountAmount;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              _logout(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            const SizedBox(height: 16), 
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
            const SizedBox(height: 16), 
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _navigateToCartPage(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 25, 17, 17)),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero)),
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


void _navigateToCartPage(BuildContext context) async {
  final authService = AuthService();
  bool isLoggedIn = await authService.isLoggedIn();
  if (isLoggedIn) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CartPage(product: product)),
    );
  } else {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}

  void _logout(BuildContext context) async {
    final loginController = LoginController();
    await loginController.logoutUser();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false, // Remove all previous routes
    );
  }
}
