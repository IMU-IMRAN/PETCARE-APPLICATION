import 'package:flutter/material.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Care'),
      ),
      backgroundColor: Colors.black, // Set the background color to black
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // "Sign up with Gmail" button with white background and black text
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle sign-up with Gmail logic here
                },
                icon: const Icon(
                  Icons.mail,
                  size: 40,
                ),
                label: const Text(
                  'Sign up with Gmail',
                  style: TextStyle(fontSize: 18, color: Colors.black), // Set text color to black
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Set button background color to white
                ),
              ),
            ),
            // "Sign up with mobile" button with white background and black text
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle sign-up with mobile logic here
                },
                icon: const Icon(
                  Icons.phone_android,
                  size: 40,
                ),
                label: const Text(
                  'Sign up with mobile',
                  style: TextStyle(fontSize: 18, color: Colors.black), // Set text color to black
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Set button background color to white
                ),
              ),
            ),
            // Sign In button with red background and white text
            ElevatedButton(
              onPressed: () {
                // Handle sign-in logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Set button background color to red
              ),
              child: const Text(
                'Sign In',
                style: TextStyle(color: Colors.white), // Set text color to white
              ),
            ),
            const SizedBox(height: 10), // Add some spacing
            // Forgot Password button with white text
            TextButton(
              onPressed: () {
                // Handle forgot password logic here
              },
              child: const Text(
                'Forgot Password?',
                style: TextStyle(color: Colors.white), // Set text color to white
              ),
            ),
          ],
        ),
      ),
    );
  }
}
