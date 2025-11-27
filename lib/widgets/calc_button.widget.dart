import 'package:flutter/material.dart';

class CalcButtonWidget extends StatelessWidget {
  const CalcButtonWidget({
    super.key,
    required this.labelColor,
    required this.boxColor,
    required this.content,
    required this.onTap,
  });

  final Color labelColor;
  final Color boxColor;
  final String content;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: boxColor,
            borderRadius: BorderRadius.circular(9),
          ),
          child: Text(
            content,
            style: TextStyle(fontSize: 50, color: labelColor),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}