import 'package:get/get.dart';
import 'package:m360_ict_task/features/home/presentation/home_screen.dart';
import 'package:m360_ict_task/helpers/appdata_helper.dart';
import '../core/constants/app_constants.dart';
import '../features/authentication/presentation/signin_screen.dart';

void checkUserLogin() async {
  await Future.delayed(const Duration(seconds: 3), () {
    if (appData.read(kKayAccessToken) != null) {
      Get.offAll(() => HomeScreen());
    } else {
      Get.offAll(() => SignInScreen());
    }
  });
}
