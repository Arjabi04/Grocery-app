import 'package:flutter/material.dart';
import 'package:grocery_app/widget/product_card_square.dart';
import 'package:grocery_app/widget/top_navbar.dart';
import 'package:grocery_app/widget/progress_order_widget.dart';
import 'package:grocery_app/widget/button.dart';

class OrderDetail extends StatelessWidget {
  const OrderDetail({super.key});

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
                    "Order Detail",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),

            // Main scrollable content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SimpleProgressOrder(
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlI1j7V70C_7ygnBN2coYFTPHDkSeP5N4P1Q&s',
                      storeName: 'Nippon Mart',
                      orderId: '#2019482',
                      status: 'Delivered',
                    ),
                    const SizedBox(height: 10),
                    Divider(color: Colors.grey[300], thickness: 1),
                    const SizedBox(height: 10),
                    const Text(
                      "Date & Time",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Text(
                      "28/06/2024, 8:00 PM",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Delivered to",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Text(
                      "Home, Kemayoran, Cendana Street 1, Adinata Housing ...",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 10),
                    Divider(color: Colors.grey[300], thickness: 1),
                    ProductRowItem(
                      imageUrl:
                          'https://www.allrecipes.com/thmb/8eg2mEDhj_-wTppSadAddLSXZCw=/0x512/filters:no_upscale():max_bytes(150000):strip_icc()/11991-egg-noodles-Beauty-3x4-22172e14a61644a8962c42871debbf21.jpg',
                      name: 'Egg Pasta',
                      price: '\$15.99',
                      quantity: 'x1',
                    ),
                    ProductRowItem(
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1DrUhEt7hL2s-ONPh3f8rIhaOY_vagpMy7A&s',
                      name: 'Diet Coke',
                      price: '\$1.50',
                      quantity: 'x2',
                    ),
                    Divider(color: Colors.grey[300], thickness: 1),
                    const SizedBox(height: 20),
                    // Subtotal & Fees
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: const [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Subtotal',
                                style: TextStyle(
                                  color: Color(0xFF777777),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                '\$17.49',
                                style: TextStyle(
                                  color: Color(0xFF0D0D0D),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Delivery Fee',
                                style: TextStyle(
                                  color: Color(0xFF777777),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                '\$6',
                                style: TextStyle(
                                  color: Color(0xFF0D0D0D),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Tax & Other Fees',
                                style: TextStyle(
                                  color: Color(0xFF777777),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                '\$2.50',
                                style: TextStyle(
                                  color: Color(0xFF0D0D0D),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Total
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Total',
                            style: TextStyle(
                              color: Color(0xFF0D0D0D),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '\$25.99',
                            style: TextStyle(
                              color: Color(0xFF0D0D0D),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),

            // Bottom button
            Padding(
              padding: const EdgeInsets.all(16),
              child: BottomButton(
                text: 'Reorder',
                backgroundColor: Colors.black,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
