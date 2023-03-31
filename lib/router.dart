import 'package:get/get.dart';
import 'package:nytimes_cloudium/ui/Screens/home_screen/home_screen.dart';
import 'package:nytimes_cloudium/ui/Screens/news_screen/news_screen.dart';
import 'package:nytimes_cloudium/ui/screens/home_screen/home_binding.dart';
import 'package:nytimes_cloudium/ui/screens/news_screen/news_binding.dart';
import 'package:nytimes_cloudium/ui/screens/splash_screen/splash_screen.dart';

class RoutePaths {
  static const String splash = '/';
  static const String homeScreen = '/home';
  static const String newsScreen = '/news';
}

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: RoutePaths.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: RoutePaths.homeScreen,
      binding: HomeBinding(),
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: RoutePaths.newsScreen,
      binding: NewsBinding(),
      page: () => NewsScreen(),
    ),
  ];
}
