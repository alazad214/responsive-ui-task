import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:m360_ict_task/features/home/presentation/home_screen.dart';
import 'package:m360_ict_task/helpers/appdata_helper.dart';

import '../../../core/constants/app_constants.dart';

class SignupControlloer extends GetxController {
  final auth = FirebaseAuth.instance;
  final users = FirebaseAuth.instance.currentUser;
  RxBool isSecured = true.obs;
  RxBool isSecured2 = true.obs;
  var email = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;
  RxBool isLoading = false.obs;

  void isSecuredFunc() {
    isSecured.value = !isSecured.value;
  }

  void isSecuredFunc2() {
    isSecured2.value = !isSecured2.value;
  }

  void signupFunc() async {
    if (password.value != confirmPassword.value) {
      Get.snackbar(
        'Password Mismatch',
        'Password and Confirm Password do not match.',
        snackPosition: SnackPosition.TOP,
      );
      return;
    }
    try {
      isLoading.value = true;
      await auth
          .createUserWithEmailAndPassword(
            email: email.value,
            password: password.value,
          )
          .then((value) {
            if (value.user != null) {
              Get.offAll(HomeScreen());
              appData.write(kKayAccessToken, 'Signup successfully');
              isLoading.value = false;
            }
          });

      //Auth Exception-->>
    } on FirebaseAuthException catch (error) {
      Get.snackbar(
        'Something went wrong!',
        error.message ?? 'An error occurred',
      );
      isLoading.value = false;
    }
  }
}
