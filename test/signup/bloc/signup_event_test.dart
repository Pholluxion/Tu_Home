// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:tu_home/signup/bloc/bloc.dart';

void main() {
  group('SignupEvent', () {
    group('CustomSignupEvent', () {
      test('supports value equality', () {
        expect(
          CustomSignupEvent(),
          equals(const CustomSignupEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(const CustomSignupEvent(), isNotNull);
      });
    });
  });
}
