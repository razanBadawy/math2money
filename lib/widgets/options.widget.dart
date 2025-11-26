import 'package:flutter/material.dart';

class OptionsWidget extends StatelessWidget {
  final bool isOption;
  const OptionsWidget({super.key, required this.isOption});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (isOption == true) ...[
          Icon(Icons.history, size: 30.0, color: Colors.white),
          Icon(Icons.straighten, size: 30.0, color: Colors.white),
          Icon(Icons.superscript, size: 30.0, color: Colors.white),
          SizedBox(width: 150.0),
          Icon(Icons.arrow_circle_left, size: 30.0, color: Colors.white),
        ],
      ],
    );
  }
}
