import 'package:get/get.dart';
import 'package:nytimes_cloudium/constants/app_images.dart';

import '../../../api/api.dart';
import '../../../models/most_popular.dart';

class HomeController extends GetxController {
  List<Results> results = [];
  bool isLoading = false;

  @override
  void onInit() {
    getResults();
    super.onInit();
  }

  void getResults() async {
    toggleLoading();
    var newsResults = await fetchResults();
    results.clear();
    results.addAll(newsResults.results ?? []);
    toggleLoading();
  }

  getMediaUrl(Results result) {
    if ((result.media?.length ?? 0) > 0) {
      if ((result.media![0].mediaMetadata?.length ?? 0) > 0) {
        return result.media![0].mediaMetadata![0].url;
      }
    }
    return Images.logoUrl;
  }

  void toggleLoading() {
    isLoading = !isLoading;
    update();
  }
}
