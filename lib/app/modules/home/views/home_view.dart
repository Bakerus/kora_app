import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kora/app/core/design/images.dart';
import 'package:kora/app/core/widgets/circularProgress.dart';
import 'package:kora/app/modules/account_connexion/views/account_connexion_view.dart';
import 'package:kora/app/modules/home/views/temperature_and_humidity_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = HomeController();
    homeController.onInit();
    // GetStorage getstorage = GetStorage();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.22,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.plantBackground),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Center(
                  child: Text(
                "22:10:7",
                style: TextStyle(fontSize: 50.0, color: Colors.white),
              )),
            ),
            SizedBox(
              child: Card(
                color: const Color.fromRGBO(255, 255, 255, 0.85),
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                child: Column(children: [
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: itemscard(
                        context: context,
                        title: "temperature",
                        buttontitle: "réguler",
                        height: 69.0,
                        width: 69.0,
                        currentStep: homeController.temperature.value.isEmpty
                            ? 0
                            : int.parse(homeController.temperature.value
                                .split('.')
                                .first),
                        settings: () {
                          Get.to(TemperatureAndHumidityView(
                            title: const Text("Temperature"),
                            descriptionType: "temperature",
                            progressIcon: Text(
                              "${homeController.temperature.value}°",
                              style: Get.theme.textTheme.subtitle1,
                            ),
                            currentStep: int.parse(homeController
                                .temperature.value
                                .split('.')
                                .first),
                          ));
                        },
                        progressIcon: Text(
                          "${homeController.temperature.value}°",
                          style: Get.theme.textTheme.subtitle1,
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      padding: const EdgeInsets.all(15.0),
                      child: itemscard(
                        context: context,
                        title: "humidite",
                        buttontitle: "réguler",
                        height: 69.0,
                        width: 69.0,
                        currentStep: homeController.humiditeAir.value.isEmpty
                            ? 0
                            : int.parse(homeController.humiditeAir.value
                                .split('.')
                                .first),
                        settings: () {
                          Get.to(TemperatureAndHumidityView(
                            title: const Text("Humidité"),
                            descriptionType: "humiditeAir",
                            progressIcon: Text(
                              "${homeController.humiditeAir.value}%",
                              style: Get.theme.textTheme.subtitle1,
                            ),
                            currentStep: int.parse(homeController
                                .humiditeAir.value
                                .split('.')
                                .first),
                          ));
                        },
                        progressIcon: Text(
                          "${homeController.humiditeAir.value}%",
                          style: Get.theme.textTheme.subtitle1,
                        ),
                      ),
                    ),
                  )
                ]),
              ),
            ),
            SizedBox(
              child: Card(
                color: const Color.fromRGBO(255, 255, 255, 0.85),
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                child: Column(children: [
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: itemscard(
                        context: context,
                        title: "éclairage",
                        buttontitle: "allumer",
                        height: 69.0,
                        width: 69.0,
                        currentStep: homeController.lumiere.value ? 100 : 0,
                        settings: () {
                          homeController.setparameters(parametre: "luminosite", valeur:true ,);
                        },
                        progressIcon: Text(
                          homeController.lumiere.value ? "ON" : "OFF",
                          style: Get.theme.textTheme.subtitle1,
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      padding: const EdgeInsets.all(15.0),
                      child: itemscard(
                        context: context,
                        title: "arrosage",
                        buttontitle: "arroser",
                        height: 69.0,
                        width: 69.0,
                        currentStep: homeController.arroseur.value ? 100 : 0,
                        settings: () {
                          // TODO: Mettre la fonction pour mettre à jour les etats de l'arrosage
                        },
                        progressIcon: Text(
                          homeController.arroseur.value ? "ON" : "OFF",
                          style: Get.theme.textTheme.subtitle1,
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: (() async {
                      Get.to(const AccountConnexionView());
                      // Serre? serre = await SerreProvider.instance.getSerre();
                      // print(serre?.temperature);
                      // homeController.onInit();
                      // print(
                      //     "temperature : ${int.parse(homeController.temperature.value.split('.').first)}");
                    }),
                    icon: const Icon(
                      Icons.add_circle,
                      size: 40,
                      color: Color.fromRGBO(14, 98, 12, 1),
                    )),
                const Text(
                  'Ajouter Serre',
                  style: TextStyle(color: Color.fromRGBO(14, 98, 12, 1)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Row itemscard({
    required context,
    required title,
    required buttontitle,
    required Text progressIcon,
    required Function() settings,
    required width,
    required height,
    required currentStep,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircularProgress(
          progressIcon: progressIcon,
          width: width,
          height: height,
          currentStep: currentStep,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style:
                        const TextStyle(color: Color.fromRGBO(14, 98, 12, 1)),
                  ),
                  SizedBox(
                    child: OutlinedButton(
                      onPressed: settings,
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                              color: Color.fromRGBO(14, 98, 12, 1))),
                      child: Text(
                        buttontitle,
                        style: const TextStyle(
                          color: Color.fromRGBO(14, 98, 12, 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              IconButton(
                  onPressed: settings,
                  icon: const Icon(
                    Icons.settings,
                    size: 40.0,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
