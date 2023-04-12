// ignore_for_file: unnecessary_overrides
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kora/app/data/models/serre.dart';
import 'package:kora/app/data/providers/serreprovider.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  final temperature = "".obs;
  final humiditeAir = "".obs;
  final lumiere = false.obs;
  final arroseur = false.obs;
  GetStorage getStorage = GetStorage();
  TextEditingController descriptionValue = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    Serre? serre = await SerreProvider.instance.getSerre();
    // print(serre?.temperature);
    temperature(serre!.temperature);
    // print(temperature);
    humiditeAir(serre.humiditeAir);
    // print(humiditeAir);
    lumiere(serre.lumiere);
    arroseur(serre.arroseur);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  setparameters({String parametre = "", bool valeur = false}) {
    SerreProvider.instance.setparameters(
        id: "411f6f607221459f9b73c711fc7407a9",
        user: getStorage.read("email"),
        parametre: parametre,
        valeur: valeur);
  }
}
