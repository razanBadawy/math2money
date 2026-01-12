import 'package:flutter/material.dart';

class ToButtonWidget extends StatelessWidget {
  final String currencyLabel;

  const ToButtonWidget({super.key, required this.currencyLabel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'To',
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
            children: [
              Text(
                currencyLabel,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
