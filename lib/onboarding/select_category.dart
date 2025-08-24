import 'package:flutter/material.dart';
import 'package:grocery_app/widget/top_navbar.dart';
import 'package:grocery_app/widget/button.dart'; // Import BottomButton

class SelectCategory extends StatefulWidget {
  const SelectCategory({super.key});

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  final List<String> categories = [
    'Gluten-Free',
    'Vegan Friendly',
    'Raw Meat',
    'Organic',
    'Dairy-Free',
    'Sugar-Free',
    'Cruelty-Free',
    'Processed Food',
    'Show +22 More',
  ];

  final Set<String> selectedCategories = {};

  Widget categoryBox(String text) {
    final isSelected = selectedCategories.contains(text);

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (isSelected) {
              selectedCategories.remove(text);
            } else {
              selectedCategories.add(text);
            }
          });
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected
                ? const Color.fromARGB(255, 219, 242, 220)
                : Colors.grey[100],
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: isSelected
                  ? const Color.fromARGB(255, 117, 205, 120)
                  : Colors.transparent,
              width: isSelected ? 2 : 0,
            ),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
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

              // Display categories in rows
              Row(
                children: [
                  categoryBox('Gluten-Free'),
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
            ],
          ),
        ),
      ),

      // BottomButton pinned at the bottom
      bottomNavigationBar: BottomButton(
        text: 'Continue',
        backgroundColor: Colors.black,
        textColor: Colors.white,
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/setLocation');
        },
      ),
    );
  }
}
