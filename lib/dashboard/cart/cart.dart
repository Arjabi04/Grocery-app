import 'package:flutter/material.dart';
import 'package:grocery_app/dashboard/cart/current_order.dart';
import 'package:grocery_app/dashboard/cart/my_cart.dart';
import 'package:grocery_app/dashboard/cart/previous_order.dart';
import 'package:grocery_app/widget/top_navbar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
                children: [
                  const HeaderWithBack(),
                  const SizedBox(width: 12),
                  const Text(
                    "Cart",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),

            // Tabs
            TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
              labelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              labelPadding: const EdgeInsets.symmetric(horizontal: 5.0),
              tabs: const [
                Tab(text: 'My Cart'),
                Tab(text: 'Current Order'),
                Tab(text: 'Previous Order'),
              ],
            ),

            // Tab views
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 16,
                ),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // My Cart Tab
                    ListView(
                      children: const [
                        CartItemWidget(
                          storeName: 'Nippon Mart',
                          products: [
                            {
                              'name': 'Fresh Wagyu Beef',
                              'variant': '500 gr',
                              'price': '20.99',
                              'image':
                                  'https://cdn.shopify.com/s/files/1/0012/4328/3505/files/Picture6_acdca27e-0762-4fc5-9319-5fcf9951a736.jpg?v=1705383078',
                            },
                            {
                              'name': 'Chicken Egg',
                              'variant': '250 gr',
                              'price': '6.50',
                              'image':
                                  'https://media.post.rvohealth.io/wp-content/uploads/2020/12/duck-chicken-egg-eggs-732x549-thumbnail-732x549.jpg',
                            },
                          ],
                        ),
                      ],
                    ),

                    // Current Order Tab
                    const CurrentOrderWidget(),

                    // Previous Order Tab
                    const PreviousOrder(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
