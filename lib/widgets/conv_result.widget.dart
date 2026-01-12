import 'package:flutter/material.dart';

class ConvResultWidget extends StatelessWidget {
  final String resultText;
  final String currencyCode;

  const ConvResultWidget({
    super.key,
    required this.resultText,
    required this.currencyCode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      decoration: BoxDecoration(
        color: Colors.green[700],
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5.0),
          Text(
            '$resultText $currencyCode',
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
