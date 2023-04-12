// import 'package:email_auth/email_auth.dart';
// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class LoginController extends GetxController {
 
  final count = 0.obs;
  var verificationCode = "".obs;
  // var isdiplay = true.obs;
  TextEditingController emailVerfication = TextEditingController();
  // EmailAuth emailAuth = EmailAuth(sessionName: "");
  var storage = GetStorage();

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

  // void sendEmailVerification() async {
  //   emailAuth.sessionName = "Create Account Session";
  //   var res = emailAuth.sendOtp(recipientMail: storage.read('email'));
  //   if(res != true) {
  //     print("No send");
  //   }else{
  //     print("Send");
  //   }
  // }

  // void validationEmailVerification() async {
  //   var res = emailAuth.validateOtp(recipientMail: storage.read('email'), userOtp: verificationCode.value);
  //   if(res){
  //     print("valid");
  //   }else{
  //     print("invalid");
  //   }
  // }

}