import 'package:flutter/material.dart';
import 'package:grocery_app/dashboard/favorite.dart';
import 'package:grocery_app/dashboard/home_page.dart';
import 'package:grocery_app/dashboard/cart.dart';
import 'package:grocery_app/dashboard/profile_details.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  // Placeholder pages for each tab
  final List<Widget> _pages = [
    const HomePage(),
    const CartScreen(),
    const FavoriteScreen(),
    const ProfileDetails(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: 84,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 243, 240, 252),
          boxShadow: [
            BoxShadow(
              color: const Color(0x19000000),
              blurRadius: 4,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(icon: Icons.home, label: "Home", index: 0),
            _buildNavItem(icon: Icons.shopping_bag, label: "Cart", index: 1),
            _buildNavItem(
              icon: Icons.bookmarks_sharp,
              label: "Favorite",
              index: 2,
            ),
            _buildNavItem(icon: Icons.person, label: "Profile", index: 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: isSelected
            ? BoxDecoration(
                color: const Color.fromARGB(255, 225, 221, 232),
                borderRadius: BorderRadius.circular(10),
              )
            : null,
        child: Row(
          children: [
            Icon(icon, color: isSelected ? Colors.black : Colors.grey),
            if (isSelected) ...[
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  color: Color(0xFF0D0D0D),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
