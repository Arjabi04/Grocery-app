import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  final List<String> categories;

  const CategorySelector({super.key, required this.categories});

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0; // Tracks the selected category

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              decoration: ShapeDecoration(
                color: isSelected
                    ? const Color(0xFF0D0D0D)
                    : const Color(0xFFF2F2F3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: Center(
                child: Text(
                  widget.categories[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : const Color(0xFF0D0D0D),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
