import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SignInController extends GetxController {
  RxBool rememberMe = false.obs;
  RxBool isSecured = true.obs;

  void isSecuredFunc() {
    isSecured.value = !isSecured.value;
  }
}
