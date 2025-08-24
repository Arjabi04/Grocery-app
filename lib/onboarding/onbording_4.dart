import 'package:flutter/material.dart';
import 'package:grocery_app/widget/button.dart';

class Onboarding4 extends StatelessWidget {
  const Onboarding4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Progress indicators
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
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
                  const SizedBox(width: 4),
                  Expanded(child: Container(height: 4, color: Colors.black)),
                ],
              ),
            ),

            const SizedBox(height: 250),

            // Image
            Center(
              child: Image.asset('assets/images/CashRegister.png', width: 210),
            ),

            const SizedBox(height: 26),

            // Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Best price guaranteed',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 16),

            // Subtitle
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Allowing you to stock up on your favorite items '
                'while staying within your budget.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),

            const Spacer(),
          ],
        ),
      ),

      // Bottom button
      bottomNavigationBar: BottomButton(
        text: "Get Started",
        backgroundColor: Colors.black,
        textColor: Colors.white,
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/getStarted');
        },
      ),
    );
  }
}
