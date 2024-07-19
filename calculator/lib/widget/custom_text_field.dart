import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String value;
  final Function(String) onChanged;
  final String? prefix;
  final String? suffix;

  const CustomTextField({
    super.key,
    required this.value,
    required this.onChanged,
    this.prefix,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(backgroundColor: Colors.teal[100]),
      controller: TextEditingController(text: value),
      onChanged: onChanged,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        counterStyle: TextStyle(backgroundColor: Colors.teal[400]),
        focusColor: Colors.teal[300],
        prefixText: prefix,
        suffixText: suffix,
        border: const OutlineInputBorder(),
        suffixStyle: TextStyle(backgroundColor: Colors.teal[100]),
        constraints: const BoxConstraints(maxWidth: 150),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }
}
