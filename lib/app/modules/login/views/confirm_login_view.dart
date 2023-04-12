// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kora/app/core/widgets/confirmDialog.dart';
import 'package:kora/app/modules/home/views/home_view.dart';
import 'package:kora/app/modules/identification/views/identification_view.dart';
import '../../../core/design/colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../controllers/login_controller.dart';

class ConfirmLoginView extends GetView {
  const ConfirmLoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    var storage = GetStorage();

    return Scaffold(
      appBar: AppBar(
          title: const Text('Login'),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.greenMaterial[900],
            ),
            onPressed: null,
          )),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Enter the code",
                          style: Get.theme.textTheme.headline4,
                        ),
                        Text(
                          "Enter the six-digit code that was sent to you at",
                          style: Get.theme.textTheme.subtitle2,
                        ),
                        Text(
                          storage.read('email'),
                          style: Get.theme.textTheme.headline5,
                        ),
                      ],
                    ),
                    PinCodeTextField(
                      appContext: context,
                      onChanged: (value) {
                        controller.verificationCode.value = value;
                        // print(value);
                      },
                      cursorHeight: 15,
                      enableActiveFill: true,
                      controller: controller.emailVerfication,
                      textStyle: Get.theme.textTheme.subtitle1,
                      length: 6,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        fieldWidth: 45,
                        inactiveColor: Colors.white,
                        selectedFillColor: Colors.white,
                        activeFillColor: Colors.white,
                        inactiveFillColor:
                            const Color.fromARGB(255, 224, 223, 223),
                        borderWidth: 1,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(
                      height: 80.0,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                // ignore: sort_child_properties_last
                                child: Text("Finish",
                                    style: Get.theme.textTheme.bodyText2),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<
                                            Color>(
                                        const Color.fromRGBO(55, 78, 121, 0.078))),
                                onPressed: () {
                                  // controller.validationEmailVerification();
                                  Get.dialog(
                                      ConfirmDialog(
                                        confirm: () {
                                          Get.to(const HomeView());
                                        },
                                        cancel: () {
                                          Get.back();
                                        },
                                      ),
                                      barrierColor:
                                          const Color.fromRGBO(47, 72, 88, 0.8),
                                      barrierDismissible: false);
                                },
                              ),
                            ),
                            Text(
                              "Didn’t get the code ?",
                              style: TextStyle(
                                  color: AppColors.clearPurple,
                                  fontSize:
                                      Get.theme.textTheme.subtitle2!.fontSize,
                                  fontFamily:
                                      Get.theme.textTheme.subtitle2!.fontFamily,
                                  fontWeight: Get
                                      .theme.textTheme.subtitle2!.fontWeight),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
              Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.circle),
                    Icon(Icons.circle),
                    Icon(Icons.circle),
                  ],
                )
              ]),
            ]),
      ),
    );
  }
}
