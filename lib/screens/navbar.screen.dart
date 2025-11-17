import 'package:flutter/material.dart';
import 'package:math2money/widgets/nav_bar_button.widget.dart';

class NavbarScreen extends StatelessWidget {
  const NavbarScreen({super.key, required this.screen, required this.index});
  final Widget screen;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen,

      bottomNavigationBar: Container(
        color: Colors.grey,
        child: SafeArea(
          child: Row(
            children: [
              NavBarButtonWidget(
                label: 'Calculator',
                icon: Icons.calculate,
                routingName: 'calculator',
                isSelected: index == 0,
              ),
              NavBarButtonWidget(
                label: 'Currency Convertor',
                icon: Icons.currency_exchange,
                routingName: 'currency-converter',
                isSelected: index == 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
