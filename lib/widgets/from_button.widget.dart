import 'package:flutter/material.dart';

class FromButtonWidget extends StatelessWidget {
  final String amountText;
  final String selectedCurrency;
  final List<String> currencies;
  final ValueChanged<String> onCurrencyChanged;
  final VoidCallback onSwap;

  const FromButtonWidget({
    super.key,
    required this.amountText,
    required this.selectedCurrency,
    required this.currencies,
    required this.onCurrencyChanged,
    required this.onSwap,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Text(
            'From',
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

        Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            children: [
              Text(
                amountText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        Center(
          child: IconButton(
            icon: const Icon(Icons.currency_exchange, color: Colors.white),
            onPressed: onSwap,
          ),
        ),
      ],
    );
  }
}
