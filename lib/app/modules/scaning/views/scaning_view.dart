import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kora/app/core/design/images.dart';

import '../../../core/design/colors.dart';
import '../../../core/design/theme.dart';
import '../controllers/scaning_controller.dart';

class ScaningView extends GetView<ScaningController> {
  const ScaningView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Login'),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.greenMaterial[900],
            ),
            onPressed: () {
              Get.back();
            },
          )),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.70,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Add account", style: Get.theme.textTheme.headline4),
                  Text("Scan code to add new account",
                      style: AppTheme.ligthTheme.textTheme.subtitle2),
                ],
              ),
              Center(
                child: Column(
                  children: [
                    Image.asset(AppImages.scanning),
                    ElevatedButton(
                        onPressed: () {
                          Get.put(ScaningController().scanQR());
                        },
                        child: Text(
                          "Scan",
                          style: Get.theme.textTheme.button,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
