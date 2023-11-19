import 'package:flutter/material.dart';
import 'package:pro_demo/screens/signup_screen.dart'; // Import the signup screen

class CreateAccountText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const SignupScreen()),
        );
      },
      child: const Text(
        'Create Account',
        style: TextStyle(
          color: Colors.green, // Choose your desired color
          fontSize: 16,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 100,
            ),
            Container(
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/loginimage.png'), // Replace with your image asset
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    'Welcome!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(
                          200, 50, 180, 20), // Updated text color to white
                    ),
                  ),
                  const SizedBox(height: 32),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius:
                          BorderRadius.circular(20), // Increased border radius
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'Username',
                        prefixIcon: Icon(Icons.person),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius:
                          BorderRadius.circular(20), // Increased border radius
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      // Handle login button press
                      // Add your authentication logic here
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20), // Increased border radius
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      width: double.infinity,
                      child: const Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Updated text color to white
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  CreateAccountText(), // Display the "Create Account" text
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
