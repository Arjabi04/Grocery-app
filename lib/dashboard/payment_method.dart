import 'package:flutter/material.dart';
import 'package:grocery_app/widget/top_navbar.dart';
import 'package:dotted_line/dotted_line.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  // Separate selected indices for credit and debit
  int selectedCreditIndex = 0;
  int selectedDebitIndex = -1; // none selected initially

  final List<Map<String, String>> creditCards = [
    {
      'cardText': 'Visa',
      'logoUrl':
          'https://www.visa.co.in/dam/VCOM/regional/ap/india/global-elements/images/in-visa-platinum-card-498x280.png',
    },
    {
      'cardText': 'MasterCard',
      'logoUrl':
          'https://upload.wikimedia.org/wikipedia/commons/0/04/Mastercard-logo.png',
    },
  ];

  final List<Map<String, String>> debitCards = [
    {
      'cardText': 'Mestro',
      'logoUrl':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Maestro_2016.svg/1200px-Maestro_2016.svg.png',
    },
    {
      'cardText': 'Diners Club Debit',
      'logoUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPbFkVSFoHSclBALeQuMcg5KDy9bjfwsNUJQ&s',
    },
    {
      'cardText': 'Visa',
      'logoUrl':
          'https://logos-world.net/wp-content/uploads/2020/05/Visa-Logo.png',
    },
    {
      'cardText': 'MasterCard Debit',
      'logoUrl':
          'https://upload.wikimedia.org/wikipedia/commons/0/04/Mastercard-logo.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                children: const [
                  HeaderWithBack(),
                  SizedBox(width: 12),
                  Text(
                    "Payment Method",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Credit & Debit Cards
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  PaymentCardWidget(
                    title: 'Credit Cards',
                    cards: creditCards,
                    selectedIndex: selectedCreditIndex,
                    onSelect: (i) {
                      setState(() {
                        selectedCreditIndex = i;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  PaymentCardWidget(
                    title: 'Debit Cards',
                    cards: debitCards,
                    selectedIndex: selectedDebitIndex,
                    onSelect: (i) {
                      setState(() {
                        selectedDebitIndex = i;
                      });
                    },
                  ),
                ],
              ),
            ),

            // Save Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Save button action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentCardWidget extends StatelessWidget {
  final String title;
  final List<Map<String, String>> cards;
  final int selectedIndex;
  final Function(int) onSelect;

  const PaymentCardWidget({
    super.key,
    required this.title,
    required this.cards,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          const DottedLine(
            dashLength: 4,
            dashColor: Colors.grey,
            lineThickness: 1,
          ),
          const SizedBox(height: 8),

          // Cards inside
          ...List.generate(cards.length, (i) {
            final card = cards[i];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: GestureDetector(
                onTap: () => onSelect(i),
                child: Row(
                  children: [
                    Image.network(
                      card['logoUrl']!,
                      width: 48,
                      height: 36,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      card['cardText']!,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 1.5, color: Colors.black),
                      ),
                      child: selectedIndex == i
                          ? const Center(
                              child: CircleAvatar(
                                radius: 4,
                                backgroundColor: Colors.black,
                              ),
                            )
                          : null,
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
