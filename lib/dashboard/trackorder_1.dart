import 'package:flutter/material.dart';
import 'package:grocery_app/widget/top_navbar.dart';

class Trackorder1 extends StatefulWidget {
  const Trackorder1({super.key});

  @override
  State<Trackorder1> createState() => _Trackorder1State();
}

class _Trackorder1State extends State<Trackorder1> {
  bool acceptedDone = false;
  bool pickupDone = false;
  bool onTheWayDone = false;
  bool completedDone = false; // New state for Completed step

  @override
  void initState() {
    super.initState();

    // Step 1: Accepted after 4 seconds
    Future.delayed(const Duration(seconds: 4), () {
      setState(() => acceptedDone = true);

      // Step 2: Pickup after another 4 seconds
      Future.delayed(const Duration(seconds: 4), () {
        setState(() => pickupDone = true);

        // Step 3: On the way after another 4 seconds
        Future.delayed(const Duration(seconds: 4), () {
          setState(() => onTheWayDone = true);

          // Step 4: Completed after another 4 seconds
          Future.delayed(const Duration(seconds: 4), () {
            setState(() => completedDone = true);
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String heading = completedDone
        ? "Completed"
        : onTheWayDone
        ? "Heading your way"
        : pickupDone
        ? "Heading your way"
        : "Picking up your order";

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TrackOrderWidget(
                imagePath: 'assets/images/tracking_accepted.png',
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      heading,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text.rich(
                      const TextSpan(
                        text: "Estimated delivery time ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                        children: [
                          TextSpan(
                            text: "20 mins",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    StatusRowWidget(
                      acceptedDone: acceptedDone,
                      pickupDone: pickupDone,
                      onTheWayDone: onTheWayDone,
                      completedDone: completedDone,
                    ),
                    const SizedBox(height: 30),
                    Divider(color: Colors.grey[400], thickness: 1, height: 1),
                    const SizedBox(height: 30),

                    // Show CourierDetailWidget for first 3 steps
                    if (!completedDone)
                      const CourierDetailWidget(
                        courierName: "Tommy Lee",
                        imageUrl: "https://i.redd.it/4fvsleaqub591.jpg",
                      ),

                    // Show CompletionRateButtonWidget when completed
                    if (completedDone) const CompletionRateButtonWidget(),
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

// Status Row
class StatusRowWidget extends StatelessWidget {
  final bool acceptedDone;
  final bool pickupDone;
  final bool onTheWayDone;
  final bool completedDone;

  const StatusRowWidget({
    super.key,
    required this.acceptedDone,
    required this.pickupDone,
    required this.onTheWayDone,
    required this.completedDone,
  });

  Widget statusIcon(bool isDone, bool isNext) {
    if (isDone)
      return const Icon(Icons.check_circle, color: Colors.black, size: 30);
    if (isNext) {
      return const SizedBox(
        width: 30,
        height: 30,
        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black),
      );
    }
    return const Icon(Icons.check_circle_outline, color: Colors.grey, size: 30);
  }

  Widget line(bool isActive) {
    return Expanded(
      child: Container(
        height: 2,
        color: isActive ? Colors.black : Colors.grey[300],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            statusIcon(acceptedDone, !acceptedDone),
            line(pickupDone || acceptedDone),
            statusIcon(pickupDone, !pickupDone && acceptedDone),
            line(onTheWayDone || pickupDone),
            statusIcon(onTheWayDone, !onTheWayDone && pickupDone),
            line(completedDone || onTheWayDone),
            statusIcon(completedDone, !completedDone && onTheWayDone),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Accepted", style: TextStyle(fontSize: 14)),
            Text("Pickup", style: TextStyle(fontSize: 14)),
            Text("On the way", style: TextStyle(fontSize: 14)),
            Text("Completed", style: TextStyle(fontSize: 14)),
          ],
        ),
      ],
    );
  }
}

// Track Order Image Widget
class TrackOrderWidget extends StatelessWidget {
  final String imagePath;

  const TrackOrderWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 450,
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: HeaderWithBackAndHelp(),
        ),
      ],
    );
  }
}

// Courier Detail Widget
class CourierDetailWidget extends StatelessWidget {
  final String courierName;
  final String imageUrl;

  const CourierDetailWidget({
    super.key,
    required this.courierName,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Row with image and names
        Row(
          children: [
            // Avatar
            Container(
              width: 50,
              height: 50,
              decoration: ShapeDecoration(
                shape: const OvalBorder(),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Column with "Courier" and name
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Courier',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 2),
                Text(
                  courierName,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        // Send a message row
        Row(
          children: [
            Expanded(
              child: Container(
                height: 46,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF2F2F3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                alignment: Alignment.centerLeft,
                child: const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Send a message',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Completion Rate / Close Buttons
class CompletionRateButtonWidget extends StatelessWidget {
  const CompletionRateButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Center(
            child: Text(
              'Rate',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Center(
            child: Text(
              'Close',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }
}
