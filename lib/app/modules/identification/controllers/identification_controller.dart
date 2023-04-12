// ignore_for_file: unnecessary_overrides

import 'package:get_storage/get_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kora/app/data/models/token.dart';
import 'package:kora/app/data/models/user.dart';
import 'package:kora/app/data/providers/userprovider.dart';

class IdentificationController extends GetxController {
  final count = 0.obs;
  var confirmPasswordVal = "".obs;
  var passwordVal = "".obs;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  var storage = GetStorage();
  User? _user;
  Token? _token;

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

  Future sendData() async {
    User? user = await UserProvider.instance.createAccount(
        name: name.text,
        firstname: name.text,
        email: email.text,
        password: password.text);
    _user = user;
  }

  Future identification() async {
    Token? token = await UserProvider.instance.authentification(email: email.text, password: password.text);
    _token = token;

    storage.write("token", token!.tokenValue);
    storage.read("token");
  }


  localStorage() async {
    // print('yo');
    storage.write("name", name.text);
    storage.write("password", password.text);
    storage.write("email", email.text);
    // print(storage.read("name"));
    // print(storage.read("email"));
    // print(storage.read("password"));
  }

}