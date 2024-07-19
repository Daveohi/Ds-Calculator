import 'package:flutter/material.dart';

import '../models/calculator_item.dart';

class CalculatorGridItem extends StatelessWidget {
  const CalculatorGridItem(
      {required this.item, required this.onTap, super.key});

  final CalculatorItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // color: const Color(0x28adab),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromARGB(255, 228, 237, 238)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(item.icon, height: 40),
            const SizedBox(height: 8),
            Text(
              item.name,
              textAlign: TextAlign.center,
              // style: const TextStyle(fontSize: 12),
              style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.black
                      : Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
