import 'package:ecomm/view/login/login_page.dart';
import 'package:ecomm/view/product/product_screen.dart';
import 'package:ecomm/view/register/register.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Add named key parameter

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/products',
      routes: {
        '/products': (context) => const ProductScreen(),
        '/login': (context) => const LoginScreen(),
        
        '/register': (context) => const RegisterScreen(),
      },
    );
  }
}