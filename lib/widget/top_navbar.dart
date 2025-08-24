import 'package:flutter/material.dart';

class HeaderWithBackAndHelp extends StatelessWidget {
  const HeaderWithBackAndHelp({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Back button (circle)
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Color.fromARGB(240, 255, 255, 255),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(Icons.keyboard_arrow_left, size: 28),
            ),
          ),
        ),

        // Help button (circle with "?")
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Text(
              '?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class HeaderWithBack extends StatelessWidget {
  const HeaderWithBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(121, 255, 255, 255),
              shape: BoxShape.circle,
            ),
            // padding: const EdgeInsets.all(8),
            child: Center(
              child: const Icon(Icons.keyboard_arrow_left, size: 35),
            ),
          ),
        ),
      ],
    );
  }
}
