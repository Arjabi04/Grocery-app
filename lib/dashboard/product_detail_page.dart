import 'package:flutter/material.dart';
import 'package:grocery_app/dashboard/storepage.dart';
import 'package:grocery_app/widget/category_selector.dart';
import 'package:grocery_app/widget/product_card_square.dart';
import 'package:grocery_app/widget/searchbar.dart';
import 'package:grocery_app/widget/top_navbar.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // vertical scroll
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header image with back button
              StoreHeaderWidget(
                imageUrl:
                    'https://wagyushop.com/cdn/shop/products/MgyuFiletMignon1_800x.png?v=1649698474',
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductDetailsWidget(
                      name: 'Fresh Wagyu Beef',
                      price: '\$20.99',
                      description:
                          'Wagyu beef, originating from Japan, is celebrated for its exceptional marbling, tenderness, and rich flavor. This premium beef, from specific Japanese cattle breeds, features fine streaks of intramuscular fat, creating a melt-in-your-mouth experience...',
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Choose Variant",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    CategorySelector(
                      categories: ['1 Kg', '500 Gr', '250 Gr', '100 Gr'],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text(
                    "Add to Cart",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text(
                    "Buy Now",
                    style: TextStyle(color: Colors.white),
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
