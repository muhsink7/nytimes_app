import 'package:get/get.dart';
import 'package:nytimes_cloudium/ui/screens/news_screen/news_controller.dart';

class NewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewsController());
  }
}
