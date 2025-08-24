import 'package:flutter/material.dart';
import 'package:grocery_app/widget/category_selector.dart';
import 'package:grocery_app/widget/top_navbar.dart';
import 'package:grocery_app/widget/searchbar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                children: const [
                  HeaderWithBack(),
                  SizedBox(width: 12),
                  Text(
                    "Search",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: SearchBarWidget(hintText: "Search anything"),
                  ),
                  const SizedBox(height: 20),
                  IconCategorySelector(
                    categories: [
                      IconCategoryItem(
                        label: "Filter",
                        icon: Icons.filter_list,
                        onTap: () => Navigator.pushNamed(context, '/filter'),
                      ),
                      IconCategoryItem(label: "Fruits"),
                      IconCategoryItem(label: "Vegetables"),
                      IconCategoryItem(label: "Dairy"),
                      IconCategoryItem(label: "Bakery"),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TrendingItems(
                        title: 'Trending Items',
                        items: [
                          'Vegan-Friendly Milk',
                          'Zero Sugar Soda',
                          'Fructose-Free Syrup',
                        ],
                        icons: List.generate(
                          3,
                          (_) => const Icon(
                            Icons.search,
                            size: 18,
                          ), // same search icon for all
                        ),
                      ),
                      const SizedBox(height: 20),
                      TrendingItems(
                        title: 'Recent Searches',
                        items: [
                          'Chicken Breast',
                          'Japanese Kobe Beef',
                          'Salted Egg',
                        ],
                        icons: List.generate(
                          3,
                          (_) => const Icon(
                            Icons.history,
                            size: 18,
                          ), // same history icon for all
                        ),
                      ),
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

class TrendingItems extends StatelessWidget {
  final String title;
  final List<String> items;
  final List<Widget>? icons;

  const TrendingItems({
    super.key,
    required this.title,
    required this.items,
    this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF0D0D0D),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        ...List.generate(items.length, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                icons != null && index < icons!.length
                    ? icons![index]
                    : Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                const SizedBox(width: 12),
                Text(
                  items[index],
                  style: const TextStyle(
                    color: Color(0xFF777777),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
