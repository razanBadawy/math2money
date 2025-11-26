import 'package:flutter/material.dart';

class SolutionWidget extends StatelessWidget {
const SolutionWidget({ super.key });

  @override
  Widget build(BuildContext context){
    return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),

              child: Container(
                alignment: Alignment.centerRight,
                child: Text(
                  '9',
                  style: TextStyle(fontSize: 50, color: Colors.grey),
                ),
              ),
            );
  }
}