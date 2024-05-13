import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomVerticalStepIndicator extends StatefulWidget {
  CustomVerticalStepIndicator(
      {super.key, required this.steps, required this.currentStep});

  final List<String> steps;
  int currentStep = 0;
  _CustomVerticalStepIndicatorState createState() =>
      _CustomVerticalStepIndicatorState();
}

class _CustomVerticalStepIndicatorState
    extends State<CustomVerticalStepIndicator> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.steps.map((step) {
        int index = widget.steps.indexOf(step);
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: 25,
                    height: 25,
                    margin: const EdgeInsets.symmetric(
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.purple.shade300,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    )),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  step,
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
                )
              ],
            ),
            if (index != widget.steps.length - 1)
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 70,
                    width: 2,
                    decoration: const BoxDecoration(color: Colors.blue),
                  ),
                ],
              )
          ],
        );
      }).toList(),
    );
  }
}
