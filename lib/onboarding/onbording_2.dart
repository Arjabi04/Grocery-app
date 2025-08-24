import 'package:flutter/material.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(height: 4, color: Colors.grey[300]),
                  ),
                  const SizedBox(width: 4),
                  Expanded(child: Container(height: 4, color: Colors.black)),
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
                'assets/images/DeliveryTruck.png',
                width: 210, // adjust size as needed
              ),
            ),

            const SizedBox(height: 26),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Get any packages delivered',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 16),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Get all your items conveniently, ensuring '
                'everything you need arrive without any hassle.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
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
                      Navigator.pushReplacementNamed(context, '/getStarted');
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
                      Navigator.pushReplacementNamed(context, '/onboarding3');
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
