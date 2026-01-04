import 'package:flutter/material.dart';
import 'package:grocery_app/widget/category_selector.dart';
import 'package:grocery_app/widget/product_card_square.dart';
import 'package:grocery_app/widget/top_navbar.dart';
import '../core/models/grocery.dart'; // For Product model

class ProductDetailPage extends StatelessWidget {
  final Product product; // Receive product from previous page

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header image with back button
              StoreHeaderWidget(imageUrl: product.imageUrl),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductDetailsWidget(
                      name: product.name,
                      price: "\$${product.price}",
                      description:
                          product.description ?? "No description available",
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
                    // You can generate variants dynamically if product has them
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
                  onPressed: () {
                    Navigator.pushNamed(context, '/myCart');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[200],
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
                  onPressed: () {
                    Navigator.pushNamed(context, '/myCart');
                  },
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

class StoreHeaderWidget extends StatelessWidget {
  final String imageUrl;

  const StoreHeaderWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        Image.network(imageUrl, width: double.infinity, fit: BoxFit.cover),
        // Back button
        Positioned(
          top: 16,
          left: 20,
          child: IconButton(
            icon: const Icon(
              Icons.keyboard_arrow_left,
              size: 32,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ],
    );
  }
}
