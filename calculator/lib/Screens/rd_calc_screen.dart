import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/rd_calc_controller.dart';
import '../widget/rd_calc_button.dart';

// ignore: use_key_in_widget_constructors
class RdCalcScreen extends StatelessWidget {
  final RdCalcController controller = Get.put(RdCalcController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Obx(() => Text(
                          controller.expression.value,
                          style: const TextStyle(fontSize: 24),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(() => Text(
                          controller.result.value,
                          style: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: GridView.count(
                  crossAxisCount: 4,
                  childAspectRatio: 1.3,
                  children: [
                    RdCalcButton(
                      'AC',
                      onPressed: controller.clearExpression,
                      text: 'AC',
                      isEqual: true,
                    ),
                    RdCalcButton(
                      '⌫',
                      onPressed: controller.deleteLastCharacter,
                      text: '⌫',
                      isEqual: true,
                    ),
                    
                    RdCalcButton(
                      '/',
                      onPressed: () => controller.addToExpression('/'),
                      text: '/',
                      isEqual: true,
                    ),
                    RdCalcButton(
                      'x',
                      onPressed: () => controller.addToExpression('x'),
                      text: 'x',
                      isEqual: true,
                    ),
                    RdCalcButton(
                      '7',
                      onPressed: () => controller.addToExpression('7'),
                      text: '7',
                      isEqual: true,
                    ),
                    RdCalcButton(
                      '8',
                      onPressed: () => controller.addToExpression('8'),
                      text: '8',
                      isEqual: true,
                    ),
                    RdCalcButton(
                      '9',
                      onPressed: () => controller.addToExpression('9'),
                      text: '9',
                      isEqual: true,
                    ),

                    RdCalcButton(
                      '-',
                      onPressed: () => controller.addToExpression('-'),
                      text: '-',
                      isEqual: true,
                    ),
                    RdCalcButton(
                      '4',
                      onPressed: () => controller.addToExpression('4'),
                      text: '4',
                      isEqual: true,
                    ),
                    RdCalcButton(
                      '5',
                      onPressed: () => controller.addToExpression('5'),
                      text: '5',
                      isEqual: true,
                    ),
                    RdCalcButton(
                      '6',
                      onPressed: () => controller.addToExpression('6'),
                      text: '6',
                      isEqual: true,
                    ),
                    RdCalcButton(
                      '+',
                      onPressed: () => controller.addToExpression('+'),
                      text: '+',
                      isEqual: true,
                    ),
                    RdCalcButton(
                      '1',
                      onPressed: () => controller.addToExpression('1'),
                      text: '1',
                      isEqual: true,
                    ),
                    RdCalcButton(
                      '2',
                      onPressed: () => controller.addToExpression('2'),
                      text: '2',
                      isEqual: true,
                    ),
                    RdCalcButton(
                      '3',
                      onPressed: () => controller.addToExpression('3'),
                      text: '3',
                      isEqual: true,
                    ),
                    RdCalcButton(
                      '.',
                      onPressed: () => controller.addToExpression('.'),
                      text: '.',
                      isEqual: true,
                    ),
                    RdCalcButton(
                      '0',
                      onPressed: () => controller.addToExpression('0'),
                      text: '0',
                      isEqual: true,
                    ),
                    RdCalcButton(
                      '=',
                      onPressed: controller.calculateResult,
                      isEqual: true,
                      text: '=',
                    ),
                  ],
                  
                ),
              ),
            ),
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.toggleTheme,
        child: Obx(() => Icon(
            controller.isDarkMode.value ? Icons.light_mode : Icons.dark_mode)),
      ),
    );
  }
}
