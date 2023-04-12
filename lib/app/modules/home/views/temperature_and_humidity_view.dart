import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kora/app/core/design/images.dart';
import 'package:kora/app/core/widgets/circularProgress.dart';
import 'package:kora/app/modules/home/controllers/home_controller.dart';

class TemperatureAndHumidityView extends GetView {
  Widget title;
  String descriptionType;
  Widget progressIcon;
  int currentStep = 0;
  TemperatureAndHumidityView(
      {Key? key,
      required this.title,
      required this.progressIcon,
      required this.currentStep,
      required this.descriptionType})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    HomeController homeController = HomeController();
    return Scaffold(
        appBar: AppBar(
          title: title,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.plantBackground),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(80),
                  ),
                  child: CircularProgress(
                    progressIcon: progressIcon,
                    stepSize: 10.0,
                    width: 156,
                    height: 149,
                    currentStep: currentStep,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              height: MediaQuery.of(context).size.height * 0.22,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 172, 171, 171),
                          offset: Offset(4, 4),
                          blurRadius: 14,
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4, -4),
                          blurRadius: 14,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: homeController.descriptionValue,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.thermostat),
                        label: Text("Entrez la valeur souhaitée"),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                              color: Color.fromRGBO(14, 98, 12, 1))),
                      onPressed: () {
                        // homeController.setparameters(parametre:descriptionType, valeur:homeController.descriptionValue.text);
                      },
                      child: const Text(
                        "réguler",
                        style: TextStyle(
                          color: Color.fromRGBO(14, 98, 12, 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
