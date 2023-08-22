import 'package:flutter/material.dart';

import '../../../../config/router/app_route.dart';

class welcome extends StatelessWidget {
  const welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow, // Set the background color to yellow
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Placeholder logo
            Image.asset(
              'assets/images/logo.png', // Replace this with the path to your logo image
              width: 400,
              height: 350,
            ),
            const SizedBox(height: 30),
            const Text(
              'Welcome to Cinema Hall Booking',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to the login screen when the button is pressed
                Navigator.pushNamed(context, AppRoute.loginRoute);
              },
              icon: const Icon(Icons.arrow_forward),
              label: const Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                backgroundColor: const Color.fromARGB(
                    255, 4, 4, 4), // Set the button text color
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 8, // Add a shadow to the button
                shadowColor: const Color.fromARGB(255, 243, 239, 5)
                    .withOpacity(0.4), // Set the shadow color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
