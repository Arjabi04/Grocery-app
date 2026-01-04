import 'package:flutter/material.dart';
import 'package:grocery_app/widget/category_selector.dart';
import 'package:grocery_app/widget/product_card_square.dart';
import 'package:grocery_app/widget/searchbar.dart';
import 'package:grocery_app/widget/top_navbar.dart';

import '../core/models/grocery.dart'; // for Store and Product models

class StorePage extends StatelessWidget {
  final Store store; // Pass the selected store

  const StorePage({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header image with back button
              StoreHeaderWidget(imageUrl: store.imageUrl),
              const SizedBox(height: 20),

              // Store info + search + catalog
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StoreInfoWidget(
                      storeName: store.storeName,
                      distance: store.distanceTime,
                      rating: store.rating,
                      totalRatings: store.products.length,
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/search'),
                      child: const SearchBarWidget(hintText: "Search product"),
                    ),
                    const SizedBox(height: 20),
                    Divider(
                      color: Colors.grey[300],
                      thickness: 1,
                      indent: 16,
                      endIndent: 16,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Catalog",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Horizontal scrollable categories
                    CategorySelector(
                      categories: [
                        'All Product',
                        'Dairy Product',
                        'Fruits',
                        'Vegetables',
                        'Snacks',
                      ],
                    ),

                    const SizedBox(height: 20),

                    GridView.builder(
                      shrinkWrap:
                          true, // lets GridView take only the space it needs
                      physics:
                          const NeverScrollableScrollPhysics(), // scrolls with parent
                      itemCount: store.products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, // 3 items per row
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 0.7,
                          ),
                      itemBuilder: (context, index) {
                        final product = store.products[index];
                        return GestureDetector(
                          onTap: () => Navigator.pushNamed(
                            context,
                            '/productDetail',
                            arguments: product,
                          ),
                          child: ProductWidget(
                            name: product.name,
                            price: "\$${product.price}",
                            imageUrl: product.imageUrl,
                          ),
                        );
                      },
                    ),
                  ],
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
        Image.network(
          imageUrl,
          width: double.infinity,
          height: 350,
          fit: BoxFit.cover,
        ),
        // Back button
        Positioned(top: 16, left: 20, child: HeaderWithBack()),
      ],
    );
  }
}

/// Widget for displaying store information with a bookmark icon
class StoreInfoWidget extends StatefulWidget {
  final String storeName;
  final String distance;
  final String rating;
  final int totalRatings;

  const StoreInfoWidget({
    super.key,
    required this.storeName,
    required this.distance,
    required this.rating,
    required this.totalRatings,
  });

  @override
  State<StoreInfoWidget> createState() => _StoreInfoWidgetState();
}

class _StoreInfoWidgetState extends State<StoreInfoWidget> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.storeName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.distance,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 10),
              Text(
                "${widget.rating} (${widget.totalRatings} Ratings)",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          icon: Icon(
            isBookmarked ? Icons.bookmark : Icons.bookmark_border,
            color: isBookmarked ? Colors.black : null,
          ),
          onPressed: () {
            setState(() {
              isBookmarked = !isBookmarked;
            });
          },
        ),
      ],
    );
  }
}
