import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class RdCalcController extends GetxController {
  var expression = ''.obs;
  var result = ''.obs;
  var isDarkMode = false.obs;

  void addToExpression(String value) {
    expression.value += value;
  }

  void clearExpression() {
    expression.value = '';
    result.value = '';
  }

  void deleteLastCharacter() {
    if (expression.value.isNotEmpty) {
      expression.value =
          expression.value.substring(0, expression.value.length - 1);
    }
  }

  void calculateResult() {
    try {
      result.value = eval(expression.value).toString();
      Get.snackbar(
        'Result',
        result.value,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Get.isDarkMode ? Colors.white24 : Colors.black87,
        colorText: Get.isDarkMode ? Colors.white : Colors.white,
      );
    } catch (e) {
      result.value = 'Error';
    }
  }

  double eval(String expression) {
    expression = expression.replaceAll('x', '*');
    expression = expression.replaceAll('÷', '/');

    // Handle trigonometric functions
    // expression = _handleTrigonometricFunctions(expression);

    // Evaluate the expression
    return _evaluateExpression(expression);
  }

  // String _handleTrigonometricFunctions(String expression) {
  //   final trigFunctions = ['sin', 'cos', 'tan', 'asin', 'acos', 'atan'];
  //   for (var func in trigFunctions) {
  //     expression = _replaceTrigFunction(expression, func);
  //   }
  //   return expression;
  // }

  // String _replaceTrigFunction(String expression, String func) {
  //   final regexp = RegExp(r'\b' + func + r'\(([^)]+)\)');
  //   return expression.replaceAllMapped(regexp, (match) {
  //     final arg = _evaluateExpression(match.group(1)!);
  //     switch (func) {
  //       case 'sin':
  //         return math.sin(arg).toString();
  //       case 'cos':
  //         return math.cos(arg).toString();
  //       case 'tan':
  //         return math.tan(arg).toString();
  //       case 'asin':
  //         return math.asin(arg).toString();
  //       case 'acos':
  //         return math.acos(arg).toString();
  //       case 'atan':
  //         return math.atan(arg).toString();
  //       default:
  //         return match.group(0)!;
  //     }
  //   });
  // }

  double _evaluateExpression(String expression) {
    
    expression = expression.replaceAll(' ', '');
    final rpn = _shuntingYard(expression);
    return _evaluateRPN(rpn);
  }

  List<String> _shuntingYard(String expression) {
    final output = <String>[];
    final stack = <String>[];
    final operators = {'+': 1, '-': 1, '*': 2, '/': 2, '^': 3};
    final pattern = RegExp(r'(\d*\.?\d+|[+\-*/^()])');

    for (final match in pattern.allMatches(expression)) {
      final token = match.group(0)!;
      if (double.tryParse(token) != null) {
        output.add(token);
      } else if (token == '(') {
        stack.add(token);
      } else if (token == ')') {
        while (stack.isNotEmpty && stack.last != '(') {
          output.add(stack.removeLast());
        }
        if (stack.isNotEmpty && stack.last == '(') {
          stack.removeLast();
        }
      } else if (operators.containsKey(token)) {
        while (stack.isNotEmpty &&
            operators.containsKey(stack.last) &&
            operators[stack.last]! >= operators[token]!) {
          output.add(stack.removeLast());
        }
        stack.add(token);
      }
    }

    while (stack.isNotEmpty) {
      output.add(stack.removeLast());
    }

    return output;
  }

  double _evaluateRPN(List<String> rpn) {
    final stack = <double>[];
    for (final token in rpn) {
      if (double.tryParse(token) != null) {
        stack.add(double.parse(token));
      } else {
        final b = stack.removeLast();
        final a = stack.removeLast();
        switch (token) {
          case '+':
            stack.add(a + b);
            break;
          case '-':
            stack.add(a - b);
            break;
          case '*':
            stack.add(a * b);
            break;
          case '/':
            stack.add(a / b);
            break;
          case '^':
            stack.add(math.pow(a, b).toDouble());
            break;
        }
      }
    }
    return stack.single;
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}
