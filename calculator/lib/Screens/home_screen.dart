// import 'dart:ffi';

import 'package:calculator/controllers/calculator_controller.dart';
import 'package:calculator/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/calculator_grid_item.dart';

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatelessWidget {
  // const HomeScreen({super.key});

  final CalculatorController controller = Get.put(CalculatorController());
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/logo1.png'),
        leadingWidth: 50,
        title: Text(
          'Electro',
          style: TextStyle(
              color: Get.isDarkMode
                  ? Color.fromARGB(255, 3, 23, 39)
                  // style: TextStyle(color: Color.fromARGB(255, 3, 23, 39)
                  : Colors.black),
          // style: TextStyle(color: Color.fromARGB(255, 3, 23, 39)),
        ),
        titleSpacing: 5,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: Obx(() => Icon(themeController.isDarkMode.value
                ? Icons.light_mode
                : Icons.dark_mode)),
            onPressed: themeController.toggleTheme,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Popular Calculator',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: controller.calculators.length,
              itemBuilder: (context, index) {
                return CalculatorGridItem(
                  item: controller.calculators[index],
                  onTap: () => controller
                      .openCalculator(controller.calculators[index].name),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
