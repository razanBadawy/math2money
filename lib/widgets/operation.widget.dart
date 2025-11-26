import 'package:flutter/material.dart';

class OperationWidget extends StatelessWidget {
const OperationWidget({ super.key });

  @override
  Widget build(BuildContext context){
    return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 50.0,
                horizontal: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '2+7',
                  
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  ),
                ],
              ),
            );
  }
}