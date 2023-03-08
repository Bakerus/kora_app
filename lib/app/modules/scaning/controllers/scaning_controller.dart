import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:kora/app/core/design/colors.dart';

class ScaningController extends GetxController {
  //TODO: Implement ScaningController

  final count = 0.obs;

  String scannedQrcode='';

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

  Future<void> scanQR() async{
      try{
          scannedQrcode = await FlutterBarcodeScanner.scanBarcode('#21C092', 'Cancel', true, ScanMode.QR);
          Get.snackbar("Connection Failed", "try again"+scannedQrcode, icon: const Icon(Icons.close, size: 20, color: Color.fromRGBO(47, 72, 88, 0.8),), snackPosition:SnackPosition.BOTTOM, backgroundColor:Colors.white, colorText: AppColors.greyBlue );
      }
      on PlatformException{}
}

}