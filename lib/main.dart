import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:m360_ict_task/core/constants/app_colors.dart';
import 'package:m360_ict_task/firebase_options.dart';
import 'package:m360_ict_task/helpers/appdata_helper.dart';
import 'package:m360_ict_task/splash_screen.dart';
import 'helpers/internet_checker_helper.dart';
import 'helpers/orientation_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  Get.put(InternetController());
  await GetStorage.init();
  diSetup();
  await OrientationHelper.lockPortrait();
  runApp(DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light().copyWith(
              scaffoldBackgroundColor: AppColors.cWhite,
            ),
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
