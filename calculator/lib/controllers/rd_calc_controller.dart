import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:dart_parser/dart_parser.dart';
// import 'dart:math';

// class CalculatorController extends GetxController {
//   var expression = ''.obs;
//   var result = ''.obs;
//   var isDarkMode = false.obs;

//   void addToExpression(String value) {
//     expression.value += value;
//   }

//   void clearExpression() {
//     expression.value = '';
//     result.value = '';
//   }

//   void deleteLastCharacter() {
//     if (expression.value.isNotEmpty) {
//       expression.value =
//           expression.value.substring(0, expression.value.length - 1);
//     }
//   }

//   // void calculateResult() {
//   //   try {
//   //     var p = Parser();
//   //     var exp = p.parse(expression.value.replaceAll('x', '*'));
//   //     var cm = ContextModel();
//   //     result.value = exp.evaluate(EvaluationType.REAL, cm).toString();
//   //     Get.snackbar(
//   //       'Result',
//   //       result.value,
//   //       snackPosition: SnackPosition.TOP,
//   //       backgroundColor: Get.isDarkMode ? Colors.white24 : Colors.black87,
//   //       colorText: Get.isDarkMode ? Colors.white : Colors.white,
//   //     );
//   //   } catch (e) {
//   //     result.value = 'Error';
//   //   }
//   // }

//   // void calculateResult() {
//   //   try {
//   //     var exp = expression.value.replaceAll('x', '*');
//   //     result.value = eval(exp).toString();
//   //     Get.snackbar(
//   //       'Result',
//   //       result.value,
//   //       snackPosition: SnackPosition.TOP,
//   //       backgroundColor: Get.isDarkMode ? Colors.white24 : Colors.black87,
//   //       colorText: Get.isDarkMode ? Colors.white : Colors.white,
//   //     );
//   //   } catch (e) {
//   //     result.value = 'Error';
//   //   }
//   // }

//   double eval(String expression) {
//     // return Parser()
//     //     .parse(expression)
//     //     .evaluate(EvaluationType.REAL, ContextModel());
//     void calculateResult() {
//       try {
//         var exp = expression.value.replaceAll('x', '*');
//         var parser = Parser();
//         var expressionAst = parser.parse(exp);
//         var resultValue =
//             expressionAst.evaluate(EvaluationType.REAL, ContextModel());
//         result.value = resultValue.toString();
//         Get.snackbar(
//           'Result',
//           result.value,
//           snackPosition: SnackPosition.TOP,
//           backgroundColor: Get.isDarkMode ? Colors.white24 : Colors.black87,
//           colorText: Get.isDarkMode ? Colors.white : Colors.white,
//         );
//       } catch (e) {
//         result.value = 'Error';
//       }
//     }
//   }

//   void toggleTheme() {
//     isDarkMode.value = !isDarkMode.value;
//     Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
//   }
// }

// class RdCalcController extends GetxController {
//   var expression = ''.obs;
//   var result = ''.obs;
//   var isDarkMode = false.obs;

//   void addToExpression(String value) {
//     expression.value += value;
//   }

//   void clearExpression() {
//     expression.value = '';
//     result.value = '';
//   }

//   void deleteLastCharacter() {
//     if (expression.value.isNotEmpty) {
//       expression.value =
//           expression.value.substring(0, expression.value.length - 1);
//     }
//   }

//   void calculateResult() {
//     try {
//       var exp = expression.value.replaceAll('x', '*');
//       result.value = eval(exp).toString();
//       Get.snackbar(
//         'Result',
//         result.value,
//         snackPosition: SnackPosition.TOP,
//         backgroundColor: Get.isDarkMode ? Colors.white24 : Colors.black87,
//         colorText: Get.isDarkMode ? Colors.white : Colors.white,
//       );
//     } catch (e) {
//       result.value = 'Error';
//     }
//   }

//   double eval(String expression) {
//     return Parser()
//         .parse(expression)
//         .evaluate(EvaluationType.REAL, ContextModel());
//   }

//   void toggleTheme() {
//     isDarkMode.value = !isDarkMode.value;
//     Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
//   }
// }

// class CalculatorScreen extends StatelessWidget {
//   final CalculatorController controller = Get.put(CalculatorController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               flex: 2,
//               child: Container(
//                 padding: EdgeInsets.all(16),
//                 alignment: Alignment.bottomRight,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Obx(() => Text(
//                           controller.expression.value,
//                           style: TextStyle(fontSize: 24),
//                         )),
//                     SizedBox(height: 8),
//                     Obx(() => Text(
//                           controller.result.value,
//                           style: TextStyle(
//                               fontSize: 48, fontWeight: FontWeight.bold),
//                         )),
//                   ],
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 3,
//               child: Container(
//                 padding: EdgeInsets.all(8),
//                 child: GridView.count(
//                   crossAxisCount: 4,
//                   childAspectRatio: 1.3,
//                   children: [

//                   ]
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: controller.toggleTheme,
//         child: Obx(() => Icon(
//             controller.isDarkMode.value ? Icons.light_mode : Icons.dark_mode)),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
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
