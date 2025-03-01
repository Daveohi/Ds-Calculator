import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/loan_calc_controller.dart';
import '../widget/custom_text_field.dart';

class LoanCalcScreen extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  LoanCalcScreen({super.key});

  final LoanCalcController controller = Get.put(LoanCalcController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/logo1.png'),
        leadingWidth: 50,
        title: const Text(
          'Electro',
          style: TextStyle(color: Color.fromARGB(255, 3, 23, 39)),
        ),
        titleSpacing: 5,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Loan Calculator',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20, height: 3)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Loan amount'),
                  SizedBox(
                    width: 150,
                    height: 30,
                    child: CustomTextField(
                      value: controller.loanAmount.value.toStringAsFixed(0),
                      onChanged: (value) => controller.updateLoanAmount(
                        double.tryParse(value) ?? controller.minLoanAmount,
                      ),
                      prefix: '₹',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(() => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 7,
                            child: Slider(
                              thumbColor: Colors.white,
                              activeColor: Colors.teal[300],
                              value: controller.loanAmount.value,
                              min: controller.minLoanAmount,
                              max: controller.maxLoanAmount,
                              onChanged: controller.updateLoanAmount,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Rate of interest (p.a)'),
                  SizedBox(
                    width: 150,
                    height: 30,
                    child: CustomTextField(
                      value: controller.interestRate.value.toStringAsFixed(1),
                      onChanged: (value) => controller
                          .updateInterestRate(double.tryParse(value) ?? 0.0),
                      suffix: '%',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(() => Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Slider(
                          thumbColor: Colors.white,
                          activeColor: Colors.teal[300],
                          value: controller.interestRate.value,
                          min: 0.0,
                          max: 50,
                          divisions: 190,
                          onChanged: controller.updateInterestRate,
                        ),
                      ),
                    ],
                  )),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Loan tenure (years)'),
                  SizedBox(
                    width: 150,
                    height: 30,
                    child: CustomTextField(
                      value: controller.loanTenure.value.toString(),
                      onChanged: (value) => controller
                          .updateLoanTenure(double.tryParse(value) ?? 0),
                      suffix: 'Yr',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(() => Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Slider(
                          thumbColor: Colors.white,
                          activeColor: Colors.teal[300],
                          value: controller.loanTenure.value.toDouble(),
                          min: 0.0,
                          max: 100,
                          divisions: 29,
                          onChanged: controller.updateLoanTenure,
                        ),
                      ),
                    ],
                  )),
              const SizedBox(height: 32),
              Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Monthly EMI: '),
                          Text('₹${controller.monthlyEMI.toStringAsFixed(0)}'),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Principal amount:'),
                          Text(
                              '₹${controller.loanAmount.value.toStringAsFixed(0)}'),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Total interest: '),
                          Text(
                              '₹${controller.totalInterest.toStringAsFixed(0)}'),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Total amount: '),
                          Text('₹${controller.totalAmount.toStringAsFixed(0)}'),
                        ],
                      ),
                    ],
                  )),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () {
                        // Implement share functionality
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          backgroundColor: Colors.teal[300]),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.share_outlined, size: 20),
                          Text(
                            'SHARE',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 32),
                  SizedBox(
                    width: 120,
                    child: OutlinedButton(
                      onPressed: () {
                        // Implement save as PDF functionality
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        backgroundColor: Colors.teal[300],
                      ),
                      // foregroundColor: Colors.teal),
                      child: const Text(
                        'Save as PDF',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
