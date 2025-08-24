import 'package:flutter/material.dart';
import 'package:grocery_app/widget/category_selector.dart';
import 'package:grocery_app/widget/product_card_square.dart';
import 'package:grocery_app/widget/searchbar.dart';
import 'package:grocery_app/widget/top_navbar.dart';

class Storepage extends StatelessWidget {
  const Storepage({super.key});

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
                    'https://media.timeout.com/images/105460851/750/422/image.jpg',
              ),
              const SizedBox(height: 16),

              // Store info + search + catalog
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
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/search'),
                      child: const SearchBarWidget(hintText: "Search product"),
                    ),
                    const SizedBox(height: 8),
                    Divider(
                      color: Colors.grey[300],
                      thickness: 1,
                      indent: 16,
                      endIndent: 16,
                    ),
                    const SizedBox(height: 8),
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

                    // Products 3x3
                    Column(
                      children: List.generate(3, (rowIndex) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    '/productDetail',
                                  ),
                                  child: ProductWidget(
                                    name: 'Fresh Wagyu Beef',
                                    price: '\$20.99',
                                    imageUrl:
                                        'https://cdn.shopify.com/s/files/1/1785/5627/t/60/assets/what_is_wagyu_beef-1684718175209_1000x.jpg?v=1684718176',
                                  ),
                                ),
                                SizedBox(width: 12),
                                ProductWidget(
                                  name: 'Milk',
                                  price: '\$9.50',
                                  imageUrl:
                                      'https://images.immediate.co.uk/production/volatile/sites/30/2020/02/Glass-and-bottle-of-milk-fe0997a.jpg?resize=1366,1366',
                                ),
                                SizedBox(width: 12),
                                ProductWidget(
                                  name: 'Cheese',
                                  price: '\$12.00',
                                  imageUrl:
                                      'https://cheesemaking.com/cdn/shop/files/cheddar-cheese-making-recipe.jpg?crop=center&height=1200&v=1743632339&width=1200',
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
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
