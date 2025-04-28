import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SignupControlloer extends GetxController {
  RxBool isSecured = true.obs;
  RxBool isSecured2 = true.obs;

  void isSecuredFunc() {
    isSecured.value = !isSecured.value;
  }

  void isSecuredFunc2() {
    isSecured2.value = !isSecured2.value;
  }
}
