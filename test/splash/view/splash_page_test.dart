// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tu_home/modules/splash/splash.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SplashPage', () {
    testWidgets('renders SplashView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: SplashPage()));
      expect(find.byType(SplashView), findsOneWidget);
    });
  });
}
