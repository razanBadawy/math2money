import 'package:flutter/material.dart';

class ToButtonWidget extends StatelessWidget {
  final String selectedCurrency;
  final List<String> currencies;
  final ValueChanged<String> onCurrencyChanged;

  const ToButtonWidget({
    super.key,
    required this.selectedCurrency,
    required this.currencies,
    required this.onCurrencyChanged,
  });

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
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedCurrency,
              isExpanded: true,
              iconEnabledColor: Colors.white,
              dropdownColor: Color.fromARGB(255, 34, 34, 34),
              items: currencies
                  .map(
                    (code) => DropdownMenuItem<String>(
                      value: code,
                      child: Text(
                        code,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  onCurrencyChanged(value);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
