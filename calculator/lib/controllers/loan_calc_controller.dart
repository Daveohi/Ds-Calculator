import 'dart:math';

import 'package:get/get.dart';

class LoanCalcController extends GetxController {
  final loanAmount = 1000000.0.obs;
  final interestRate = 6.5.obs;
  final loanTenure = 5.obs;

  final minLoanAmount = 1000.0;
  final maxLoanAmount = 1000000.0;

// Monthly EMI for the given loan amount, interest rate, and loan tenure.
  double get monthlyEMI {
    double r = interestRate.value / (12 * 100);
    double n = loanTenure.value * 12;
    return (loanAmount.value * r * pow(1 + r, n)) / (pow(1 + r, n) - 1);
  }

// Total interest paid by the borrower over the loan period.
  double get totalInterest {
    return (monthlyEMI * loanTenure.value * 12) - loanAmount.value;
  }

// Total amount paid by the borrower including interest over the loan period.
  double get totalAmount {
    return loanAmount.value + totalInterest;
  }

// Update loan amount observable value.  If the new value is not a valid number, reset it
  void updateLoanAmount(double value) {
    loanAmount.value = value;
  }

// Update interest rate observable value.  If the new value is not a valid number, reset it
  void updateInterestRate(double value) {
    interestRate.value = value;
  }

// Update loan tenure observable value.  If the new value is not a valid number, reset it
  void updateLoanTenure(double value) {
    loanTenure.value = value.toInt();
  }

  
  
}
