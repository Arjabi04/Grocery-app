import 'package:flutter/material.dart';
import 'package:grocery_app/widget/progress_order_widget.dart';

class PreviousOrder extends StatelessWidget {
  const PreviousOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/orderDetail');
          },
          child: ProgressOrder(
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlI1j7V70C_7ygnBN2coYFTPHDkSeP5N4P1Q&s',
            storeName: 'Nippon Mart',
            orderId: '#2019482',
            dateTime: '30/06/2024, 4:15 PM',
            totalPrice: '35.99',
            itemCount: 2,
            status: 'Delivered',
            trackText: 'View Detail',
          ),
        ),
        SizedBox(height: 20),
        ProgressOrder(
          imageUrl:
              'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/The_Fresh_Market_logo.svg/1200px-The_Fresh_Market_logo.svg.png',
          storeName: 'Fresh Market',
          orderId: '#2019483',
          dateTime: '01/07/2024, 11:00 AM',
          totalPrice: '25.50',
          itemCount: 3,
          status: 'Canceled',
          trackText: 'View Details',
        ),
      ],
    );
  }
}
