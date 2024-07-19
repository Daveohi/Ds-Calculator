import 'package:flutter/material.dart';

class NumberSelector extends StatelessWidget {
  final int value;
  final ValueChanged<int> onChanged;

  const NumberSelector({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final textColor =
        brightness == Brightness.dark ? Colors.black : Colors.black;

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.remove_circle_outline,
                color: Color(0xFFE5D3B3)),
            onPressed: () => onChanged(value - 1),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFE5D3B3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                value.toString(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
          ),
          IconButton(
            icon:
                const Icon(Icons.add_circle_outline, color: Color(0xFFE5D3B3)),
            onPressed: () => onChanged(value + 1),
          ),
        ],
      ),
    );
  }
}
