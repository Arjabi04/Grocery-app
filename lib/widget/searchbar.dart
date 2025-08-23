import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final String hintText;

  const SearchBarWidget({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F3),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Color(0xFF777777)),
          const SizedBox(width: 10),
          Text(
            hintText,
            style: const TextStyle(
              color: Color(0xFF777777),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
