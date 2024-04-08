import 'package:ecomm/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:ecomm/view/product/product_details.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // Calculate the total amount after discount
    double totalAmount = double.parse(product.price ?? '0');
    if (product.discount != null && product.discount!.isNotEmpty) {
      double discountAmount = double.parse(product.discount ?? '0');
      totalAmount -= discountAmount;
    }

    return Card(
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsPage(product: product),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                product.imageUrl ?? '',
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Text(
                product.name ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Price: Rs ${product.price ?? ''}',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            if (product.discount != null && product.discount!.isNotEmpty) // Check if discount is available
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Discount: Rs ${product.discount}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.red, // Assuming discount should be shown in red
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Total : Rs ${totalAmount.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
