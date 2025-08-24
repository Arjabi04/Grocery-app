import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;

  const BottomButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: backgroundColor,
                minimumSize: const Size(double.infinity, 48),
              ),
              child: Text(
                text,
                style: TextStyle(fontSize: 16, color: textColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
