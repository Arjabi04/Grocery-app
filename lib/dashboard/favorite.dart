import 'package:flutter/material.dart';
import 'package:grocery_app/widget/store_card.dart';
import 'package:grocery_app/widget/top_navbar.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

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
                    "Favorite",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),

            // Favorite Stores List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/storePage');
                    },
                    child: StoreWidget(
                      storeName: "Nippon Mart",
                      distanceTime: "4 km  •  15 mins",
                      imageUrl:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlI1j7V70C_7ygnBN2coYFTPHDkSeP5N4P1Q&s",
                    ),
                  ),
                  SizedBox(height: 12),
                  StoreWidget(
                    storeName: "Fresh Mart",
                    distanceTime: "2 km  •  5 mins",
                    imageUrl:
                        "https://play-lh.googleusercontent.com/sk9bWJ_X98w2g2Wj9qwsQUPcGlWWtld3QmbGQVYV8GnKayCX6jD3tJWk3DwtWMTMPtmD",
                  ),
                  SizedBox(height: 12),
                  StoreWidget(
                    storeName: "Jaya Mart",
                    distanceTime: "3 km  •  10 mins",
                    imageUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT40r8CJqJXrCyCTHNpqFge7noClx8EqdVlQA&s",
                  ),
                  SizedBox(height: 12),
                  StoreWidget(
                    storeName: "Nihongo Mart",
                    distanceTime: "1.5 km  •  4 mins",
                    imageUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcK7jzUvRO7sKoMWq4kKry4zPFZyH1xQx-gA&s",
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
