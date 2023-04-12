import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kora/app/core/design/colors.dart';
import 'package:kora/app/core/design/theme.dart';
import 'package:kora/app/core/utils/controller.dart';
import 'package:kora/app/modules/login/views/confirm_login_view.dart';

import '../../../core/widgets/snackbar.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      var emailEditingController = TextEditingController();
      GlobalAppController control = Get.put(GlobalAppController());
      Snackbar snackbar = const Snackbar();
      
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
                height: MediaQuery.of(context).size.height * 0.50,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.35,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Welcome",
                                        style: Get.theme.textTheme.headline4),
                                    Text("Please enter your mail here",
                                        style: AppTheme
                                            .ligthTheme.textTheme.subtitle2),
                                  ]),
                              SizedBox(
                                height: 150.0,
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                          height: 56,
                                          child: TextField(
                                              controller:
                                                  emailEditingController,
                                              decoration: const InputDecoration(
                                                prefixIcon: Icon(
                                                  Icons.mail_outlined,
                                                  size: 24,
                                                ),
                                                labelText: "e-mail",
                                              ))),
                                      SizedBox(
                                          height: 56,
                                          child: Obx(() => TextField(
                                                obscureText:
                                                    control.isdiplay.value,
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
                                                              : Icons
                                                                  .visibility_off,
                                                          color:
                                                              AppColors.grey)),
                                                  labelText: "confirm password",
                                                ),
                                              ),
                                            ),
                                           ),
                                    ]),
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: 100,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        if (GetUtils.isEmail(
                                            emailEditingController.text)) {
                                          Get.to(const ConfirmLoginView());
                                        } else {
                                          snackbar.showSnackbar(title:"Erreur", message: "Veuillez veridiez votre email");
                                        }
                                      },
                                      child: Text(
                                        "Continue",
                                        style: Get.theme.textTheme.button,
                                      ))),
                              Text(
                                "You will receive mail code for verification",
                                style: Get.theme.textTheme.subtitle2,
                              ),
                            ]),
                      ),
                    ]),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.circle),
                      Icon(Icons.circle),
                      Icon(Icons.circle),
                    ],
                  )
                ],
              ),
            ]),
      ),
    );
  }
}
