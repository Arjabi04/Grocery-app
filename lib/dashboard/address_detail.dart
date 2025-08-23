import 'package:flutter/material.dart';
import 'package:grocery_app/widget/top_navbar.dart';

class AddressDetail extends StatelessWidget {
  const AddressDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              // Header
              Row(
                children: const [
                  HeaderWithBack(),
                  SizedBox(width: 12),
                  Text(
                    "Address Detail",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // Address cards
              const AddressDetailWidget(
                title: 'Home ',
                name: 'John Doe',
                phone: '+62 888 1234 5678',
                address:
                    'Kemayoran, Cendana Street 1, Adinata Housing Complex, 10610, Jakarta, Indonesia',
              ),
              const AddressDetailWidget(
                title: 'Office',
                name: 'Jane Smith',
                phone: '+62 888 9876 5432',
                address: 'Menteng, Jl. Melati No. 5, Jakarta, Indonesia',
              ),
              SizedBox(height: 20),
              // Add new address button
              Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.add_circle,
                      size: 40, // adjust size as needed
                      color: Colors.grey[400], // icon color
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Add New Address",
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddressDetailWidget extends StatelessWidget {
  final String title;
  final String name;
  final String phone;
  final String address;

  const AddressDetailWidget({
    super.key,
    required this.title,
    required this.name,
    required this.phone,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: ShapeDecoration(
        color: const Color(0xFFF2F2F2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Stack(
        children: [
          Column(
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
              const SizedBox(height: 12),
              const Divider(color: Colors.grey, thickness: 1),
              const SizedBox(height: 8),
              Text(
                name,
                style: const TextStyle(
                  color: Color(0xFF0D0D0D),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                phone,
                style: const TextStyle(
                  color: Color(0xFF777777),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                address,
                style: const TextStyle(
                  color: Color(0xFF777777),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          // Static trailing icon
          Positioned(
            right: 0,
            top: 0,
            child: Icon(Icons.edit, size: 18, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
