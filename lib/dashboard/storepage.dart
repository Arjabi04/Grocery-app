import 'package:flutter/material.dart';
import 'package:grocery_app/widget/category_selector.dart';
import 'package:grocery_app/widget/searchbar.dart';
import 'package:grocery_app/widget/top_navbar.dart';

class Storepage extends StatelessWidget {
  const Storepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header image with back button
            StoreHeaderWidget(
              imageUrl:
                  'https://media.timeout.com/images/105460851/750/422/image.jpg',
            ),

            SizedBox(height: 16),

            // Store info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StoreInfoWidget(
                    storeName: "Nippon Mart",
                    distance: "4 km • 15 mins",
                    rating: 4.8,
                    totalRatings: 435,
                  ),
                  SizedBox(height: 10),
                  SearchBarWidget(hintText: "Search product"),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(
                      color: Colors.grey[300], // grey 300
                      thickness: 1, // line thickness
                      indent: 16, // left indent
                      endIndent: 16, // right indent
                    ),
                  ),
                  Text(
                    "Catalog",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  CategorySelector(
                    categories: [
                      'All Product',
                      'Dairy Product',
                      'Fruits',
                      'Vegetables',
                      'Snacks',
                    ],
                  ),
                ],
              ),
            ),
          ],
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
        const Positioned(top: 16, left: 20, child: HeaderWithBack()),
      ],
    );
  }
}

/// Widget for displaying store information with a bookmark icon
class StoreInfoWidget extends StatefulWidget {
  final String storeName;
  final String distance;
  final double rating;
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
        // Store info texts
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.storeName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                widget.distance,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 4),
              Text(
                "⭐ ${widget.rating} (${widget.totalRatings} Ratings)",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        // Bookmark icon
        IconButton(
          icon: Icon(
            isBookmarked ? Icons.bookmark : Icons.bookmark_border,
            color: isBookmarked ? const Color.fromARGB(255, 0, 0, 0) : null,
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
