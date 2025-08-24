import 'package:flutter/material.dart';
import 'package:grocery_app/widget/button.dart';
import 'package:grocery_app/widget/product_card.dart';
import 'package:grocery_app/widget/top_navbar.dart';

class CheckoutSummary extends StatelessWidget {
  const CheckoutSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16),

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: const [
                    HeaderWithBack(),
                    SizedBox(width: 12),
                    Text(
                      "Checkout Summary",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Delivery Address
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: const Text(
                          "Delivery Address",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const IconTextArrowWidget(
                        title: "Home",
                        address: "Kemayoran, Cendana Street 1, Adinata",
                      ),
                      const SizedBox(height: 30),

                      // Products in Cart
                      const Text(
                        "Products in Cart",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: const [
                            ProductSummary(
                              title: 'Fresh Wagyu Beef',
                              variant: '500 gr',
                              price: '20.99',
                              imageUrl:
                                  'https://cdn.shopify.com/s/files/1/0012/4328/3505/files/Picture6_acdca27e-0762-4fc5-9319-5fcf9951a736.jpg?v=1705383078',
                              initialQuantity: 1,
                            ),
                            SizedBox(height: 20),
                            ProductSummary(
                              title: 'Chicken Egg',
                              variant: '250 gr',
                              price: '6.50',
                              imageUrl:
                                  'https://media.post.rvohealth.io/wp-content/uploads/2020/12/duck-chicken-egg-eggs-732x549-thumbnail-732x549.jpg',
                              initialQuantity: 2,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 40),

                      // Bill Details
                      const Text(
                        "Bill Details",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            ),
                          ],
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

                      const SizedBox(height: 10),

                      // Promo Code
                      Container(
                        width: double.infinity,
                        height: 46,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(100),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Add Promo',
                                style: TextStyle(
                                  color: const Color(0xFF777777),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Container(
                              width: 88,
                              height: 38,
                              decoration: BoxDecoration(
                                color: const Color(0xFF0D0D0D),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              alignment: Alignment.center,
                              child: const Text(
                                'Apply',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 30),
                      const Text(
                        "Payment Method",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const IconTextArrowWidget(
                        title: "View Payment Method",
                        icon: Icons.credit_card,
                      ),
                      const SizedBox(height: 20),
                      BottomButton(
                        text: "Confirm Your Order",
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        onPressed: () {
                          // Handle button press
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IconTextArrowWidget extends StatelessWidget {
  final String title;
  final String? address;
  final IconData icon;

  const IconTextArrowWidget({
    super.key,
    required this.title,
    this.address,
    this.icon = Icons.location_on,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 24, color: Colors.grey[700]),
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
                if (address != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    address!,
                    style: const TextStyle(
                      color: Color(0xFF777777),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 18),
        ],
      ),
    );
  }
}
