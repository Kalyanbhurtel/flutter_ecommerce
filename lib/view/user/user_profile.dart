import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  final String userEmail; // Add a new property for the email

  const UserProfileScreen({super.key, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, $userEmail!'), // Display the email
            // You can add more user information here as needed
          ],
        ),
      ),
    );
  }
}
