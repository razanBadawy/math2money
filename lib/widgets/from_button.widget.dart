import 'package:flutter/material.dart';

class FromButtonWidget extends StatelessWidget {
  final String amountText;
  final String currencyLabel;
  final VoidCallback onSwap;

  const FromButtonWidget({
    super.key,
    required this.amountText,
    required this.currencyLabel,
    required this.onSwap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Text(
            'From',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                currencyLabel,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            children: [
              Text(
                amountText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        Center(
          child: IconButton(
            icon: const Icon(Icons.currency_exchange, color: Colors.white),
            onPressed: onSwap,
          ),
        ),
      ],
    );
  }
}
