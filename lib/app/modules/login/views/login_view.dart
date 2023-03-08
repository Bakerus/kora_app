import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kora/app/core/design/colors.dart';
import 'package:kora/app/core/design/theme.dart';
import 'package:kora/app/modules/login/views/confirm_login_view.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  var emailEditingController = TextEditingController();

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
                                              decoration: InputDecoration(
                                                prefixIcon: Icon(
                                                  Icons.mail_outlined,
                                                  size: 24,
                                                ),
                                                labelText: "e-mail",
                                              ))),
                                      SizedBox(
                                          height: 56,
                                          child: TextField(
                                              obscureText: true,
                                              decoration: InputDecoration(
                                                prefixIcon: const Icon(
                                                  Icons.lock_outlined,
                                                  size: 24,
                                                ),
                                                suffixIcon: IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                        Icons.remove_red_eye,
                                                        color: AppColors.grey)),
                                                labelText: "confirm password",
                                              ))),
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

                                        if(GetUtils.isEmail(emailEditingController.text)){
                                          print("The format of your e-mail is correct");
                                          Get.to(ConfirmLoginView());
                                        }else{
                                          print("This format of e-mail is incorrect");
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
