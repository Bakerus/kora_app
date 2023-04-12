// ignore_for_file: unnecessary_overrides

import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

import 'package:kora/app/core/constant.dart';
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
      if (channel != null)
        channel!.sink.add("{'type':'Serre Connection','token':$scannedQrcode}");

      Snackbar snackbar = const Snackbar();
      snackbar.showSnackbar(
          title: "Echec Connexion", message: " Essayer de scanner à nouveau");

      // Get.snackbar(
      //   "",
      //   "try again$scannedQrcode",
      //   icon: const Icon(
      //     Icons.close,
      //     size: 20,
      //     color: Color.fromRGBO(47, 72, 88, 0.8),
      //   ),
      //   snackPosition: SnackPosition.BOTTOM,
      //   titleText: Row(
      //     children: const [
      //       Text("Connection Failed")
      //     ],
      //   ),
      //   backgroundColor: Colors.white,
      //   colorText: AppColors.greyBlue,
      // );

    } on PlatformException {}
  }
}
