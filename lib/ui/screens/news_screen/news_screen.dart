import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nytimes_cloudium/constants/app_color.dart';
import 'package:nytimes_cloudium/models//most_popular.dart';
import 'package:nytimes_cloudium/api/api.dart';
import 'package:nytimes_cloudium/ui/Screens/home_screen/home_screen.dart';
import 'package:nytimes_cloudium/ui/screens/home_screen/home_controller.dart';
import 'package:nytimes_cloudium/ui/screens/news_screen/news_controller.dart';

class NewsScreen extends GetWidget<HomeController> {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GetBuilder<NewsController>(builder: (controller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '${controller.resultArg.title}',
                    style: const TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.network("${controller.getMediaUrl()}",
                      loadingBuilder:
                      (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                    print(
                        "${loadingProgress?.cumulativeBytesLoaded}  ${loadingProgress?.expectedTotalBytes}");
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(),
                      ],
                    );
                  }),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      '${controller.resultArg.byline}',
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text('${controller.resultArg.publishedDate}'),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      '${controller.resultArg.abstract}',
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
