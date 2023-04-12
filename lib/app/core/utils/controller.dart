import 'package:get/get.dart';


class GlobalAppController extends GetxController {
     var isdiplay = true.obs;

    void display(){
    isdiplay.value=!isdiplay.value;
  }

}
