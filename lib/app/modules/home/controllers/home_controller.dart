// ignore_for_file: unnecessary_overrides
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kora/app/core/widgets/snackbar.dart';
import 'package:kora/app/data/models/serre.dart';
import 'package:kora/app/data/providers/serreprovider.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  final temperature = "".obs;
  final humiditeAir = "".obs;
  final lumiere = false.obs;
  final ventilateur = false.obs;
  final luminosite = "".obs;
  final arroseur = false.obs;
  final etats = false.obs;
  GetStorage getStorage = GetStorage();
  TextEditingController descriptionValue = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    recuperEtats();
    Timer.periodic(const Duration(seconds: 2), ((timer) {
      recuperEtats();
    }));
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
    if (getStorage.read("tokenSerre") != null) {
      SerreProvider.instance.setparameters(
          tokenSerre: getStorage.read("tokenSerre"),
          user: getStorage.read("email"),
          parametre: parametre,
          valeur: valeur);
    } else {
      Snackbar snackbar = const Snackbar();
      snackbar.showSnackbar(
          title: "Echec", message: "Vous n'etes connecté à aucune Serre");
    }
  }

  recuperEtats() async {
    Serre? serre = await SerreProvider.instance.getSerre();
    // print(serre?.temperature);
    temperature(serre!.temperature);
    // print(temperature);
    humiditeAir(serre.humiditeAir);
    // print(humiditeAir);
    lumiere(serre.lumiere);
    arroseur(serre.arroseur);
    ventilateur(serre.ventilateur);
    luminosite(serre.luminosite);
  }
}
