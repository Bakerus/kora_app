import 'package:get/get.dart';

import '../controllers/account_connexion_controller.dart';

class AccountConnexionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountConnexionController>(
      () => AccountConnexionController(),
    );
  }
}
