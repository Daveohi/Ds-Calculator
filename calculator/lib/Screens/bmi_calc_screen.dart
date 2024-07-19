import 'package:calculator/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/bmi_controller.dart';
import '../widget/gender_button.dart';
import '../widget/number_select.dart';

// ignore: use_key_in_widget_constructors
class BMICalcScreen extends StatelessWidget {
  final BMIController controller = Get.put(BMIController());
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text("Let's check", style: TextStyle(color: Colors.black))),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Get.isDarkMode ? Colors.black : Colors.black),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: Obx(() => Icon(themeController.isDarkMode.value
                ? Icons.light_mode
                : Icons.dark_mode)),
            onPressed: themeController.toggleTheme,
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Gender', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Obx(() => Row(
                    children: [
                      Expanded(
                        child: GenderButton(
                          label: 'Male',
                          icon: Icons.male,
                          isSelected: controller.gender.value == 'Male',
                          onTap: () => controller.setGender('Male'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: GenderButton(
                          label: 'Female',
                          icon: Icons.female,
                          isSelected: controller.gender.value == 'Female',
                          onTap: () => controller.setGender('Female'),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(height: 24),
              const Center(
                  child: Text('Your Age', style: TextStyle(fontSize: 16))),
              const SizedBox(height: 8),
              Obx(() => Center(
                    child: NumberSelector(
                      value: controller.age.value,
                      onChanged: controller.setAge,
                    ),
                  )),
              const SizedBox(height: 24),
              const Center(
                  child:
                      Text('Your Height(cm)', style: TextStyle(fontSize: 16))),
              const SizedBox(height: 8),
              Obx(() => NumberSelector(
                    value: controller.height.value,
                    onChanged: controller.setHeight,
                  )),
              const SizedBox(height: 24),
              const Center(
                  child:
                      Text('Your Weight(kg)', style: TextStyle(fontSize: 16))),
              const SizedBox(height: 8),
              Obx(() => NumberSelector(
                    value: controller.weight.value,
                    onChanged: controller.setWeight,
                  )),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    backgroundColor: Colors.brown,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: controller.calculateBMI,
                  child: const Text(
                    'Calculate',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
