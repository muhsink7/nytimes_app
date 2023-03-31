import 'package:get/get.dart';
import 'package:nytimes_cloudium/constants/app_images.dart';
import 'package:nytimes_cloudium/ui/screens/news_screen/news_screen.dart';
import 'package:nytimes_cloudium/models/most_popular.dart';

class NewsController extends GetxController {

  final resultArg = Get.arguments as Results;

  getMediaUrl() {
    if ((resultArg.media?.length ?? 0) > 0) {
      if ((resultArg.media![0].mediaMetadata?.length ?? 0) >= 2) {
        return resultArg.media![0].mediaMetadata![2].url;
      }
    }
    return Images.logoUrl;
  }
}
