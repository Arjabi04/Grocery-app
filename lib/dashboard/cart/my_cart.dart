import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:grocery_app/widget/product_card.dart';
import 'package:grocery_app/widget/button.dart';

class CartItemWidget extends StatefulWidget {
  final String storeName;
  final List<Map<String, String>> products;

  const CartItemWidget({
    super.key,
    required this.storeName,
    required this.products,
  });

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  bool isChecked = false; // Track check/uncheck state

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Cart container
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFCCCCCC)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "• Cart 1",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                    activeColor: Colors.black,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const DottedLine(
                dashLength: 4,
                dashGapLength: 4,
                lineThickness: 2,
                dashColor: Colors.grey,
              ),
              const SizedBox(height: 10),
              const Text(
                "Store",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text(
                widget.storeName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                "Product Summary",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              ...widget.products.map((product) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: ProductSummary(
                    title: product['name']!,
                    variant: product['variant']!,
                    price: product['price']!,
                    initialQuantity:
                        int.tryParse(product['quantity'] ?? '') ?? 1,
                    imageUrl:
                        product['image'] ??
                        'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                  ),
                );
              }).toList(),
            ],
          ),
        ),

        const SizedBox(height: 180),

        // Checkout button
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/checkout');
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            child: const Text(
              'Checkout',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
