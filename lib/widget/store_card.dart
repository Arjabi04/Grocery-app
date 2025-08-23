import 'package:flutter/material.dart';

class StoreWidget extends StatelessWidget {
  final String storeName;
  final String distanceTime;
  final String? rating;
  final String? imageUrl;

  const StoreWidget({
    super.key,
    required this.storeName,
    required this.distanceTime,
    this.rating,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.symmetric(vertical: 6),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.grey[100],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Stack(
        children: [
          // Store Image
          Positioned(
            left: 12,
            top: 12,
            child: Container(
              width: 89,
              height: 76,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              child: imageUrl != null
                  ? Image.network(imageUrl!, fit: BoxFit.cover)
                  : Container(color: Colors.grey[300]),
            ),
          ),

          // Store Name & Distance/Time
          Positioned(
            left: 121,
            top: 27,
            child: SizedBox(
              width: 117,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    storeName,
                    style: const TextStyle(
                      color: Color(0xFF0D0D0D),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    distanceTime,
                    style: const TextStyle(
                      color: Color(0xFF777777),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.visible,
                    softWrap: false,
                  ),
                ],
              ),
            ),
          ),

          if (rating != null)
            Positioned(
              right: 12,
              top: 38,
              child: Text(
                rating!,
                style: const TextStyle(
                  color: Color(0xFF0D0D0D),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
