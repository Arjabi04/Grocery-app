import 'package:flutter/material.dart';
import 'package:grocery_app/widget/store_card.dart';
import 'package:grocery_app/widget/top_navbar.dart';
import '../core/services/api_service.dart';
import '../core/models/grocery.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final apiService = ApiService();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: Row(
                  children: const [
                    HeaderWithBack(),
                    SizedBox(width: 12),
                    Text(
                      "Favorite",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              // Store list
              Expanded(
                child: FutureBuilder<Grocery>(
                  future: apiService.fetchGrocery(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }

                    final stores = snapshot.data?.stores ?? [];

                    if (stores.isEmpty) {
                      return const Center(
                        child: Text('No favorite stores found.'),
                      );
                    }

                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: stores.length,
                      itemBuilder: (context, index) {
                        final store = stores[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/storePage',
                                arguments: store,
                              );
                            },
                            child: StoreWidget(
                              storeName: store.storeName,
                              distanceTime: store.distanceTime,
                              imageUrl: store.imageUrl,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
