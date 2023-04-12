import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class CircularProgress extends StatelessWidget {
  Widget? progressIcon;
  double width = 0.0;
  double height = 0.0;
  int currentStep = 0;
  double stepSize = 6.0;
  CircularProgress(
      {super.key,
      required this.progressIcon,
      this.stepSize = 6.0,
      required this.width,
      required this.height,
      this.currentStep = 0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: CircularStepProgressIndicator(
          totalSteps: 100,
          currentStep: currentStep,
          stepSize: stepSize,
          unselectedColor: const Color.fromRGBO(214, 214, 214, 0.22),
          selectedColor: const Color.fromRGBO(14, 99, 12, 1),
          // gradientColor: LinearGradient(colors: [
          //   Color.fromRGBO(215, 117, 28, 1),
          //   Color.fromRGBO(14, 99, 12, 1)
          // ]),
          roundedCap: (p0, p1) => true,
          child: Center(
            child: progressIcon,
            // Text(
            //   "24°",
            //   style: Get.theme.textTheme.subtitle1,
            // ),
          ),
        ));
  }
}
