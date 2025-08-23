import 'package:flutter/material.dart';

class ProgressOrder extends StatelessWidget {
  final String imageUrl;
  final String storeName;
  final String orderId;
  final String dateTime;
  final String totalPrice;
  final int itemCount;
  final String status;

  const ProgressOrder({
    super.key,
    required this.imageUrl,
    required this.storeName,
    required this.orderId,
    required this.dateTime,
    required this.totalPrice,
    required this.itemCount,
    this.status = 'On Progress',
  });

  @override
  Widget build(BuildContext context) {
    // Determine status colors
    Color bgColor;
    Color textColor;

    switch (status.toLowerCase()) {
      case 'delivered':
        bgColor = const Color(0x1A28A745); // light green background
        textColor = const Color(0xFF28A745); // green text
        break;
      case 'canceled':
        bgColor = const Color(0x1AFF0000); // light red background
        textColor = const Color(0xFFFF0000); // red text
        break;
      default:
        bgColor = const Color(0x19EAB600); // light yellow
        textColor = const Color(0xFFE9B600); // yellow text
    }

    return Container(
      width: double.infinity,
      height: 117,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Stack(
        children: [
          // Left: Image + Info
          Positioned(
            left: 0,
            top: 0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 70,
                  height: 75,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                SizedBox(
                  width: 137,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        storeName,
                        style: const TextStyle(
                          color: Color(0xFF0D0D0D),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        orderId,
                        style: const TextStyle(
                          color: Color(0xFF0D0D0D),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        dateTime,
                        style: const TextStyle(
                          color: Color(0xFF777777),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 1,
                        softWrap: false,
                        overflow: TextOverflow.visible,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Status badge
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: textColor),
              ),
              child: Text(
                status,
                style: TextStyle(
                  color: textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

          // Bottom: Price & Track
          Positioned(
            left: 0,
            bottom: 0,
            child: Text(
              '\$$totalPrice  •  $itemCount Items',
              style: const TextStyle(
                color: Color(0xFF0D0D0D),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Row(
              children: const [
                Text(
                  'Track Order',
                  style: TextStyle(
                    color: Color(0xFF777777),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(width: 4),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Color(0xFF777777),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SimpleProgressOrder extends StatelessWidget {
  final String imageUrl;
  final String storeName;
  final String orderId;
  final String status;

  const SimpleProgressOrder({
    super.key,
    required this.imageUrl,
    required this.storeName,
    required this.orderId,
    this.status = 'On Progress',
  });

  @override
  Widget build(BuildContext context) {
    // Determine status colors
    Color bgColor;
    Color textColor;

    switch (status.toLowerCase()) {
      case 'delivered':
        bgColor = const Color(0x1A28A745); // light green background
        textColor = const Color(0xFF28A745); // green text
        break;
      case 'canceled':
        bgColor = const Color(0x1AFF0000); // light red background
        textColor = const Color(0xFFFF0000); // red text
        break;
      default:
        bgColor = const Color(0x19EAB600); // light yellow
        textColor = const Color(0xFFE9B600); // yellow text
    }

    return Container(
      width: double.infinity,
      height: 80,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Stack(
        children: [
          // Left: Image + Info
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Container(
                width: 70,
                height: 75,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              SizedBox(
                width: 137,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      storeName,
                      style: const TextStyle(
                        color: Color(0xFF0D0D0D),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      orderId,
                      style: const TextStyle(
                        color: Color(0xFF0D0D0D),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Status badge
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: textColor),
              ),
              child: Text(
                status,
                style: TextStyle(
                  color: textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
