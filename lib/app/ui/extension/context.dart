import 'package:flutter/material.dart';
import 'package:tu_home/app/ui/ui.dart';

extension FromContext on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;

  double get xxs => AppSpacing.xxs;
  double get xs => AppSpacing.xs;
  double get s => AppSpacing.s;
  double get m => AppSpacing.m;
  double get l => AppSpacing.l;
  double get xl => AppSpacing.xl;
  double get xxl => AppSpacing.xxl;
  double get xxxl => AppSpacing.xxxl;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  Color get primaryColor => Theme.of(this).colorScheme.primary;
  Color get secondaryColor => Theme.of(this).colorScheme.secondary;
  Color get tertiaryColor => Theme.of(this).colorScheme.tertiary;
  Color get scaffoldBackgroundColor => Theme.of(this).colorScheme.background;
  Color get surfaceColor => Theme.of(this).colorScheme.surface;
  Color get errorColor => Theme.of(this).colorScheme.error;
  Color get canvasColor => Theme.of(this).canvasColor;

  TextTheme get textTheme => Theme.of(this).textTheme;

}


