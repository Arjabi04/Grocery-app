import 'package:flutter/material.dart';
import 'package:grocery_app/widget/top_navbar.dart';

class SetLocation extends StatelessWidget {
  const SetLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              const SizedBox(height: 20),

              HeaderWithBackAndHelp(),

              const SizedBox(height: 150),

              Center(
                child: Image.asset(
                  'assets/images/Illustration.png',
                  width: 210, // adjust size as needed
                ),
              ),

              const SizedBox(height: 26),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Welcome to Grocerya',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 16),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Get your grocery needs at your service within a minute. '
                  'Fast, efficient, and convenient.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ),

              const Spacer(),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/enableNotification');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    child: const Text(
                      'Allow Google Maps',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/enableNotification');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[100],
                    ),
                    child: const Text(
                      'Set Manually',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
