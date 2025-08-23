import 'package:flutter/material.dart';
import 'package:grocery_app/dashboard/cart/my_cart.dart';
import 'package:grocery_app/widget/top_navbar.dart';

class CheckoutSummary extends StatelessWidget {
  const CheckoutSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                children: const [
                  HeaderWithBack(),
                  SizedBox(width: 12),
                  Text(
                    "Checkout Summary",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),

            // Main Sections
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Delivery Address",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  AddressCard(
                    title: "Home",
                    address: "Kemayoran, Cendana Street 1, Adinata",
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Products in Cart",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),
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

            // Bill Details in Separate Container
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Bill Details",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Subtotal"), Text("Rs. 2000")],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Delivery Fee"), Text("Rs. 100")],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Rs. 2100",
                        style: TextStyle(fontWeight: FontWeight.bold),
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

class AddressCard extends StatelessWidget {
  final String title;
  final String address;

  const AddressCard({super.key, required this.title, required this.address});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.location_on, size: 24, color: Colors.grey),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
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
                const SizedBox(height: 4),
                Text(
                  address,
                  style: const TextStyle(
                    color: Color(0xFF777777),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 18),
        ],
      ),
    );
  }
}
