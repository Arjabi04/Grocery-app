import 'package:flutter/material.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Simple progress bar: 4 lines, 1st black, rest grey
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(height: 4, color: Colors.black),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Container(height: 4, color: Colors.grey[300]),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Container(height: 4, color: Colors.grey[300]),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Container(height: 4, color: Colors.grey[300]),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 250),

            Center(
              child: Image.asset(
                'assets/images/FullTrolley.png',
                width: 210, // adjust size as needed
              ),
            ),

            const SizedBox(height: 26),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Welcome to Grocerya',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 16),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Get your grocery needs at your service within a minute. '
                'Fast, efficient, and convenient.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      // TODO: Handle skip
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                       minimumSize: const Size(170, 48),
                    ),
                    child: const Text(
                      'Skip',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Handle next
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                       minimumSize: const Size(170, 48),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
