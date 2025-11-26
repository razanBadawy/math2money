import 'package:flutter/material.dart';

class ConvResultWidget extends StatelessWidget {
  const ConvResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          Text(
            'Converted Amount',
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
          SizedBox(height: 5.0),
          Text(
            '€6.85',
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            '1 USD = 0.9200 EUR',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
