// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tu_home/modules/splash/cubit/splash_cubit.dart';
import 'package:tu_home/modules/splash/splash.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SplashBody', () {
    testWidgets('renders Text', (tester) async {
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => SplashCubit(),
          child: MaterialApp(home: SplashBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
