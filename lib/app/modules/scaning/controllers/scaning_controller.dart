// ignore_for_file: unnecessary_overrides

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

import 'package:kora/app/core/constant.dart';
import 'package:kora/app/modules/home/views/home_view.dart';
import '../../../core/widgets/snackbar.dart';

class ScaningController extends GetxController {
  final count = 0.obs;

  String scannedQrcode = '';

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  Future<void> scanQR() async {
    try {
      scannedQrcode = await FlutterBarcodeScanner.scanBarcode(
          '#21C092', 'Cancel', true, ScanMode.QR);
      print(scannedQrcode);

      if (scannedQrcode.isEmpty) {
        Snackbar snackbar = const Snackbar();
        snackbar.showSnackbar(
            title: "Echec Connexion", message: " Essayer de scanner à nouveau");
        print(scannedQrcode);
      } else {
        if (channel != null) {
          channel!.sink.add(json
              .encode({'type': 'Serre Connection', 'token': scannedQrcode}));
        }
        Snackbar snackbar = const Snackbar();
        snackbar.showSnackbar(
            title: "success", message: "Le code QR a été scanné avec succés");
        Get.to(const HomeView());
      }
    } on PlatformException {}
  }
}
