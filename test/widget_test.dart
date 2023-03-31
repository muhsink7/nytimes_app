// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:nytimes_cloudium/main.dart';
import 'package:nytimes_cloudium/ui/screens/home_screen/home_controller.dart';

void main() {
  testWidgets('Check if loading is changed', (WidgetTester tester) async {
    final controller = HomeController();

    var loading = controller.isLoading;

    controller.toggleLoading();

    expect(loading, !controller.isLoading);

  });
}
