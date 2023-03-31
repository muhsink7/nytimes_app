import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nytimes_cloudium/constants/app_color.dart';
import 'package:nytimes_cloudium/router.dart';
import 'package:nytimes_cloudium/ui/screens/home_screen/home_controller.dart';


class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        leading: const Icon(Icons.menu),
        title: const Text('NY Times Most Popular'),
        actions: [
          IconButton(
            onPressed: () {
              controller.getResults();
            },
            icon: const Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: GetBuilder<HomeController>(builder: (controller) {
        if (controller.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Center(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.results.length,
            itemBuilder: (ctx, index) {
              final result = controller.results[index];
              return GestureDetector(
                onTap: () {
                  Get.toNamed(RoutePaths.newsScreen, arguments: result);
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                            radius: 30,
                            backgroundColor: primaryColor,
                            backgroundImage: NetworkImage(
                                "${controller.getMediaUrl(result)}")),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Text(
                                      "${result.title}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        height: 1.3,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Wrap(
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Stack(
                                      children: [
                                        Text(
                                          "${result.byline}",
                                          style: const TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey,
                                            height: 1.3,
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              (result.byline?.length ?? 0) < 27
                                                  ? Alignment.topRight
                                                  : Alignment.bottomRight,
                                          child: Padding(
                                            padding:
                                                (result.byline?.length ?? 0) <
                                                        27
                                                    ? const EdgeInsets.all(0.0)
                                                    : const EdgeInsets.only(
                                                        top: 20.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const Icon(
                                                  Icons.date_range,
                                                  size: 15,
                                                  color: Colors.grey,
                                                ),
                                                Text(
                                                  "${result.publishedDate}",
                                                  textAlign: TextAlign.end,
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  style: const TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.grey,
                                                    height: 1.3,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
