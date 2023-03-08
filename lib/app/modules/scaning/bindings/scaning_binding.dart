import 'package:get/get.dart';

import '../controllers/scaning_controller.dart';

class ScaningBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScaningController>(
      () => ScaningController(),
    );
  }
}
