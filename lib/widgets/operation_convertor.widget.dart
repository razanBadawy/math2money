import 'package:flutter/material.dart';

class OperationConvertorWidget extends StatelessWidget {
  const OperationConvertorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 380),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              // border: Border.all(color: Colors.white24),
            ),
            child: Text(
              '100+150',

              style: TextStyle(fontSize: 50, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
