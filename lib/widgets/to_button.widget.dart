import 'package:flutter/material.dart';

class ToButtonWidget extends StatelessWidget {
  const ToButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('To', style: const TextStyle(color: Colors.white, fontSize: 20)),

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
                    'EUR - Euro',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
              const Icon(Icons.arrow_drop_down, color: Colors.white),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}
