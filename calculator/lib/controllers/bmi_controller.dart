import 'package:get/get.dart';

class BMIController extends GetxController {
  var gender = 'Male'.obs;
  var age = 28.obs;
  var height = 172.obs;
  var weight = 68.obs;

  void setGender(String value) => gender.value = value;
  void setAge(int value) => age.value = value;
  void setHeight(int value) => height.value = value;
  void setWeight(int value) => weight.value = value;

  void calculateBMI() {
    double bmi = weight.value / ((height.value / 100) * (height.value / 100));
    String result = 'Your BMI is ${bmi.toStringAsFixed(1)}';
    Get.snackbar(
      'BMI Result',
      result,
      snackPosition: SnackPosition.TOP,
    );
  }
}
