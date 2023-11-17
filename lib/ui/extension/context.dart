import 'package:flutter/material.dart';
import 'package:tu_home/ui/ui.dart';

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
}
