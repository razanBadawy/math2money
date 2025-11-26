import 'package:flutter/material.dart';

class FromButtonWidget extends StatelessWidget {
  const FromButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('From', style: const TextStyle(color: Colors.white, fontSize: 20)),

        Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Text(
                    'USD - United States Dollar',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
              const Icon(Icons.arrow_drop_down, color: Colors.white),
            ],
          ),
        ),
        const SizedBox(height: 10.0),

        const Center(child: Icon(Icons.currency_exchange, color: Colors.white)),
      ],
    );
  }
}
