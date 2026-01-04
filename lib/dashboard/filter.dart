import 'package:flutter/material.dart';
import 'package:grocery_app/widget/top_navbar.dart';
import 'package:grocery_app/widget/category_selector.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  RangeValues _priceRange = const RangeValues(20, 100); // start from $20
  bool _veganYes = false;
  bool _veganNo = false;

  @override
  Widget build(BuildContext context) {
    const double minPrice = 20;
    const double maxPrice = 500;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: const [
                  HeaderWithBack(),
                  SizedBox(width: 12),
                  Text(
                    "Sort & Filter",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // Price Range
              const Text(
                'Price Range',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.black,
                  inactiveTrackColor: Colors.black26,
                  thumbColor: Colors.black,
                  overlayColor: Colors.black12,
                ),
                child: RangeSlider(
                  values: _priceRange,
                  min: minPrice,
                  max: maxPrice,
                  divisions: 10,
                  labels: RangeLabels(
                    '\$${_priceRange.start.toInt()}',
                    '\$${_priceRange.end.toInt()}',
                  ),
                  onChanged: (RangeValues values) {
                    setState(() {
                      _priceRange = values;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),

              // Rating
              const Text(
                'Rating',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              IconCategorySelector(
                categories: [
                  IconCategoryItem(label: "5 Stars"),
                  IconCategoryItem(label: "4 Stars"),
                  IconCategoryItem(label: "3 Stars"),
                ],
              ),
              const SizedBox(height: 40),

              // Vegan Friendly
              const Text(
                'Vegan Friendly',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        activeColor: Colors.black,
                        checkColor: Colors.white,
                        value: _veganYes,
                        onChanged: (value) {
                          setState(() {
                            _veganYes = value ?? false;
                            if (_veganYes) _veganNo = false;
                          });
                        },
                      ),
                      const Text('Yes'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        activeColor: Colors.black,
                        checkColor: Colors.white,
                        value: _veganNo,
                        onChanged: (value) {
                          setState(() {
                            _veganNo = value ?? false;
                            if (_veganNo) _veganYes = false;
                          });
                        },
                      ),
                      const Text('No'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              // Save button action
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/search');
              },
              child: const Text(
                'Apply Filter',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
