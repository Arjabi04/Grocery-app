import 'package:flutter/material.dart';
import 'package:grocery_app/widget/top_navbar.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
          child: SingleChildScrollView(
            // 👈 Wrap with scroll view
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: const [
                    HeaderWithBack(),
                    SizedBox(width: 12),
                    Text(
                      "Profile Details",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Profile Card
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: const ProfileCard(
                    name: "John Doe",
                    email: "johndoe@gmail.com",
                    imageUrl:
                        "https://i.pinimg.com/736x/b7/7e/02/b77e025fce3784c582618935c4a4eeb0.jpg",
                  ),
                ),

                const SizedBox(height: 30),

                // Section Title
                const Text(
                  "General",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),

                const SizedBox(height: 10),
                Column(
                  children: const [
                    ProfileOptionCard(
                      icon: Icons.location_on,
                      title: "Address Details",
                    ),
                    ProfileOptionCard(
                      icon: Icons.local_shipping,
                      title: "Pickup Option",
                    ),
                    ProfileOptionCard(
                      icon: Icons.receipt_long,
                      title: "My Orders",
                    ),
                    ProfileOptionCard(
                      icon: Icons.contrast,
                      title: "Appearance",
                    ),
                    ProfileOptionCard(
                      icon: Icons.lock,
                      title: "Change Password",
                      showDivider: false,
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // Support
                const Text(
                  "Support",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Column(
                  children: const [
                    ProfileOptionCard(
                      icon: Icons.chat,
                      title: "Need Help? Let's Chat",
                    ),
                    ProfileOptionCard(
                      icon: Icons.privacy_tip,
                      title: "Privacy Policy",
                    ),
                    ProfileOptionCard(
                      icon: Icons.book_rounded,
                      title: "Terms of Service",
                      showDivider: false,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Column(
  children: const [
    ProfileOptionCard(
      icon: Icons.location_on,
      title: "Log Out",
      textColor: Colors.red, 
      showDivider: false,
    ),
  ],
),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Profile Card Widget
class ProfileCard extends StatelessWidget {
  final String name;
  final String email;
  final String imageUrl;

  const ProfileCard({
    super.key,
    required this.name,
    required this.email,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 35, backgroundImage: NetworkImage(imageUrl)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ),
          const Icon(Icons.edit, size: 24, color: Colors.grey),
        ],
      ),
    );
  }
}
class ProfileOptionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final bool showDivider;
  final Color? textColor;

  const ProfileOptionCard({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.showDivider = true,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            color: Colors.grey[100],
            child: Row(
              children: [
                Icon(icon, size: 24, color: textColor ?? Colors.grey[600]),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: textColor ?? const Color(0xFF0D0D0D), 
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
        if (showDivider)
          Divider(
            color: Colors.grey[400],
            height: 0,
            thickness: 1,
            indent: 16,
            endIndent: 16,
          ),
      ],
    );
  }
}
