import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavBarButtonWidget extends StatelessWidget {
  const NavBarButtonWidget({
    super.key,
    required this.label,
    required this.icon,
    required this.routingName,
    required this.isSelected,
  });
  final String label;
  final IconData icon;
  final String routingName;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(icon),
            color: isSelected
                ? const Color.fromARGB(255, 2, 95, 5)
                : Colors.black,

            onPressed: () {
              context.goNamed(routingName);
            },
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Color.fromARGB(255, 2, 95, 5) : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
