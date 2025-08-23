import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final String name;
  final String price;
  final String imageUrl; // New image property
  final Color backgroundColor;

  const ProductWidget({
    super.key,
    required this.name,
    required this.price,
    required this.imageUrl,
    this.backgroundColor = const Color(0xFFF2F2F3),
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 120,
          height: 160,
          child: Stack(
            children: [
              // Product background with image
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 120,
                  height: 100,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: backgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: imageUrl.isNotEmpty
                      ? Image.network(imageUrl, fit: BoxFit.cover)
                      : null,
                ),
              ),

              // Product name and price
              Positioned(
                left: 2,
                top: 108,
                child: SizedBox(
                  width: 90,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          color: Color(0xFF0D0D0D),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        price,
                        style: const TextStyle(
                          color: Color(0xFF777777),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
