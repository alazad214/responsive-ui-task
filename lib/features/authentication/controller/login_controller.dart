import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:m360_ict_task/features/home/presentation/home_screen.dart';

import '../../../core/constants/app_constants.dart';
import '../../../helpers/appdata_helper.dart';

class SignInController extends GetxController {
  final auth = FirebaseAuth.instance;
  final users = FirebaseAuth.instance.currentUser;
  RxBool rememberMe = false.obs;
  RxBool isSecured = true.obs;
  var email = ''.obs;
  var password = ''.obs;
  RxBool isLoading = false.obs;

  void isSecuredFunc() {
    isSecured.value = !isSecured.value;
  }

  void logInFunc() async {
    try {
      isLoading.value = true;
      await auth
          .signInWithEmailAndPassword(
            email: email.value,
            password: password.value,
          )
          .then((value) {
            if (value.user != null) {
              appData.write(kKayAccessToken, 'Signup successfully');
              Get.offAll(HomeScreen());
              isLoading.value = false;
            }
          });
    } on FirebaseAuthException catch (error) {
      isLoading.value = false;

      Get.snackbar(
        'Something went wrong!',
        error.message ?? 'An error occurred',
      );
    }
  }
}
