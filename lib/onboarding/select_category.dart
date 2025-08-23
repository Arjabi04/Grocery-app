import 'package:flutter/material.dart';
import 'package:grocery_app/widget/top_navbar.dart';

class SelectCategory extends StatelessWidget {
  const SelectCategory({super.key});

  Widget categoryBox(String text, {Color? bgColor, Color? borderColor}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: bgColor ?? Colors.grey[100],
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: borderColor ?? Colors.transparent,
            width: borderColor != null ? 2 : 0,
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              HeaderWithBackAndHelp(),

              const SizedBox(height: 50),

              const Text(
                'All your grocery need in one place',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              const Text(
                'Select your desired shop category',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),

              const SizedBox(height: 30),

              Row(
                children: [
                  categoryBox(
                    'Gluten-Free',
                    bgColor: const Color.fromARGB(255, 219, 242, 220),
                    borderColor: const Color.fromARGB(255, 117, 205, 120),
                  ),
                  categoryBox('Vegan Friendly'),
                ],
              ),
              Row(
                children: [
                  categoryBox('Raw Meat'),
                  categoryBox('Organic'),
                  categoryBox('Dairy-Free'),
                ],
              ),

              Row(
                children: [
                  categoryBox('Sugar-Free'),
                  categoryBox('Cruelty-Free'),
                ],
              ),

              Row(
                children: [
                  categoryBox('Processed Food'),
                  categoryBox('Show +22 More'),
                ],
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Continue button action
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: const Text(
                    'Continue',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
