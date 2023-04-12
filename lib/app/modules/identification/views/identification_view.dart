import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kora/app/core/design/images.dart';
import 'package:kora/app/core/utils/controller.dart';
import 'package:kora/app/core/widgets/snackbar.dart';
import 'package:kora/app/data/providers/userprovider.dart';
import 'package:kora/app/routes/app_pages.dart';
// import 'package:kora/app/modules/login/controllers/login_controller.dart';
import '../../../core/design/colors.dart';
import '../controllers/identification_controller.dart';

class IdentificationView extends GetView<IdentificationController> {
  const IdentificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalAppController control = Get.put(GlobalAppController());
    Snackbar snackbar = const Snackbar();
    // var emailEditingController = TextEditingController();
    IdentificationController controller = Get.put(IdentificationController());
    // LoginController loginController = LoginController();

    return Scaffold(
      appBar: AppBar(
          title: const Text('Identifier vous'),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.greenMaterial[900],
            ),
            onPressed: null,
          )),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.65,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(AppImages.validate),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.35,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                height: 56,
                                child: TextField(
                                    controller: controller.name,
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.account_circle,
                                        size: 24,
                                      ),
                                      labelText: "user name",
                                    ))),
                            SizedBox(
                                height: 56,
                                child: TextField(
                                    controller: controller.email,
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.mail_outlined,
                                        size: 24,
                                      ),
                                      labelText: "e-mail",
                                    ))),
                            SizedBox(
                                height: 56,
                                child: TextField(
                                  obscureText: control.isdiplay.value,
                                  controller: controller.password,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.mail_outlined,
                                      size: 24,
                                    ),
                                    
                                    labelText: "password",
                                  ),
                                  onChanged: ((String string) {
                                    controller.passwordVal.value = string;
                                    // print("pass $controller.passwordVal.value");
                                  }),
                                )),
                            SizedBox(
                                height: 56,
                                child: Obx(() => TextField(
                                      obscureText: control.isdiplay.value,
                                      decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.lock_outlined,
                                          size: 24,
                                        ),
                                        suffixIcon: IconButton(
                                            onPressed: () {
                                              control.display();
                                            },
                                            icon: Icon(
                                                control.isdiplay.value
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                                color: AppColors.grey)),
                                        labelText: "confirm password",
                                      ),
                                      onChanged: (String string) {
                                        controller.confirmPasswordVal.value =
                                            string;
                                        // print("confirm"+controller.confirmPasswordVal.value);
                                      },
                                    ))),
                          ],
                        ),
                      ),
                    ]),
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (GetUtils.isEmail(controller.email.text)) {
                          if (controller.confirmPasswordVal.value !=
                              controller.passwordVal.value) {
                            snackbar.showSnackbar(
                                title: "Erreur",
                                message:
                                    "verifiez le champ mot de passe et confirm mot de passe");
                          } else {
                            controller.sendData();
                            controller.identification();
                            // controller.localStorage();
                            // Get.to(HomeView());
                            if (UserProvider.instance.garde_result != null) {
                              controller.localStorage();
                              Get.offAndToNamed(Routes.HOME);
                              // loginController.sendEmailVerification();
                            } else {
                              snackbar.showSnackbar(
                                  title: "Erreur",
                                  message: "Echec de connection");
                            }
                          }
                        } else {
                          snackbar.showSnackbar(
                              title: "Erreur",
                              message: "Veuillez veridiez votre email");
                        }
                      },
                      child: Text(
                        "Continue",
                        style: Get.theme.textTheme.button,
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
