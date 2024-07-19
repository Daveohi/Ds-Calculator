import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RdCalcButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isEqual;

  const RdCalcButton(String s,
      {super.key,
      required this.text,
      required this.onPressed,
      required this.isEqual});

  // CalculatorButton(this.text, {required this.onPressed, this.isEqual = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: isEqual
              ? Colors.white
              : (Get.isDarkMode ? Colors.white : Colors.black),
          backgroundColor: isEqual
              ? Colors.blue
              : (Get.isDarkMode ? Colors.grey[800] : Colors.white),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: Text(text,
            style: const TextStyle(
              fontSize: 20,
            )),
      ),
    );
  }
}
