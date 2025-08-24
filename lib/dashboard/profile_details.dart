import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  final Box profileBox = Hive.box('Flutter');

  String get name => profileBox.get('name', defaultValue: 'John Doe');
  String get email =>
      profileBox.get('email', defaultValue: 'johndoe@gmail.com');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Card
              ProfileCard(
                name: name,
                email: email,
                imageUrl:
                    'https://i.pinimg.com/736x/b7/7e/02/b77e025fce3784c582618935c4a4eeb0.jpg',
                onEdit: _editProfile,
              ),

              const SizedBox(height: 30),

              // General Section
              const Text(
                "General",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/addressDetail'),
                    child: const ProfileOptionCard(
                      icon: Icons.location_on,
                      title: "Address Details",
                    ),
                  ),
                  const ProfileOptionCard(
                    icon: Icons.local_shipping,
                    title: "Pickup Option",
                  ),
                  const ProfileOptionCard(
                    icon: Icons.receipt_long,
                    title: "My Orders",
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/appearance'),
                    child: const ProfileOptionCard(
                      icon: Icons.contrast,
                      title: "Appearance",
                    ),
                  ),
                  const ProfileOptionCard(
                    icon: Icons.lock,
                    title: "Change Password",
                    showDivider: false,
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Support Section
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

              // Logout
              GestureDetector(
                onTap: () {
                  // Add your logout logic here
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text("Logged Out")));
                },
                child: const ProfileOptionCard(
                  icon: Icons.logout,
                  title: "Log Out",
                  textColor: Colors.red,
                  showDivider: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _editProfile() async {
    final nameController = TextEditingController(text: name);
    final emailController = TextEditingController(text: email);

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Profile"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "Email"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                profileBox.put('name', nameController.text);
                profileBox.put('email', emailController.text);
                setState(() {}); // refresh UI
                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String name;
  final String email;
  final String imageUrl;
  final VoidCallback onEdit;

  const ProfileCard({
    super.key,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.onEdit,
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
          GestureDetector(
            onTap: onEdit,
            child: const Icon(Icons.edit, size: 24, color: Colors.grey),
          ),
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
