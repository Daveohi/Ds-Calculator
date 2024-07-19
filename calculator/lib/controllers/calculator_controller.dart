// import 'package:flutter/material.dart';
import 'package:calculator/Screens/rd_calc_screen.dart';
import 'package:get/get.dart';

import '../Screens/bmi_calc_screen.dart';
import '../Screens/loan_calc_screen.dart';
import '../models/calculator_item.dart';

class CalculatorController extends GetxController {
  final List<CalculatorItem> calculators = [
    CalculatorItem(
      name: 'SIP Calculator',
      icon: 'assets/sip.png',
    ),
    CalculatorItem(name: 'Loan Calculator', icon: 'assets/loan.png'),
    CalculatorItem(name: 'SWP Calculator', icon: 'assets/swp.png'),
    CalculatorItem(name: 'FD Calculator', icon: 'assets/fd.png'),
    CalculatorItem(name: 'RD Calculator', icon: 'assets/rd.png'),
    CalculatorItem(name: 'BMI Calculator', icon: 'assets/emi.png'),
    CalculatorItem(name: 'EPF Calculator', icon: 'assets/epf.png'),
    CalculatorItem(name: 'Income Tax Calculator', icon: 'assets/tax.png'),
    CalculatorItem(name: 'PPF Calculator', icon: 'assets/ppf.png'),
    CalculatorItem(name: 'GST Calculator', icon: 'assets/gst.png'),
    CalculatorItem(
        name: 'Mutual Fund Returns Calculator', icon: 'assets/mutual-fund.png'),
    CalculatorItem(
        name: 'Sukanya Samriddhi Yojana Calculator',
        icon: 'assets/sukanya.png'),
  ];

  void openCalculator(String name) {
    switch (name) {
      case 'Loan Calculator':
        Get.to(() => LoanCalcScreen());
        break;
      case 'BMI Calculator':
        Get.to(() => BMICalcScreen());
        break;
      case 'RD Calculator':
        Get.to(() => RdCalcScreen());
        break;
      // More cases for other calculators...
      default:
        Get.snackbar('Coming soon!', 'Not implemented yet.');
    }
  }
}
