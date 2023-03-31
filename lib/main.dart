import 'package:flutter/material.dart';
import 'package:nytimes_cloudium/constants/app_color.dart';
import 'package:nytimes_cloudium/router.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: primaryColor,
      debugShowCheckedModeBanner: false,
      title: 'New York Times',
      initialRoute: RoutePaths.splash,
      getPages: AppPages.pages,
      defaultTransition: Transition.cupertino,
    );
  }
}
