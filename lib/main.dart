import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kora/app/core/constant.dart';
import 'package:kora/app/core/design/theme.dart';
import 'package:kora/app/data/providers/userprovider.dart';
import 'package:kora/app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  GetStorage getstorage = GetStorage();
  if (getstorage.read("token") != null) {
    channel = await UserProvider.instance.serreConnection();
  }
  String initialRoute() {
    if (getstorage.read("email") != null) {
      // Future.delayed(const Duration(microseconds:2000), () {
      //   Get.offAndToNamed(Routes.HOME);},);
      return Routes.HOME;
    } else {
      //  Get.offAllNamed(Routes.IDENTIFICATION);
      return Routes.IDENTIFICATION;
    }
  }

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Kora App",
      theme: AppTheme.ligthTheme,
      initialRoute: initialRoute(),
      getPages: AppPages.routes,
    ),
  );

  // TODO: Mettre les redirections sur les icones(fleches) du Appbar
  // TODO: Gerer la page answer pour afficher success ou error en fonction de quel page?
  // TODO: Gerer le bug du bouton confirm pour que le texte apparait
  // TODO: Faire la petite animation du bas de page
}
