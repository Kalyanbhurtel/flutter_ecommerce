import 'dart:convert';
import 'package:ecomm/model/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ProductController {
  Future<List<Product>> getProducts() async {
  var url = "http://192.168.18.3:8000/api/products/";

  try {
    var response = await http.get(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      var produtModel = produtModelFromJson(jsonEncode(responseData));
      return produtModel.data?.products ?? []; // Return empty list if products is null
    } else {
      throw Exception('Failed to get products: ${response.statusCode}');
    }
  } catch (error) {
    if (kDebugMode) {
      print("Error getting products: $error");
    }
    rethrow; // Rethrow the error to be handled by the caller
  }
}
static const String baseUrl = "http://192.168.18.3:8000/api/products/";
Future<Product> getProduct(int productId) async {
    var url = baseUrl + productId.toString();

    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        var product = Product.fromJson(responseData);
        return product;
      } else {
        throw Exception('Failed to get product: ${response.statusCode}');
      }
    } catch (error) {
      if (kDebugMode) {
        print("Error getting product: $error");
      }
      rethrow;
    }
  }

}
