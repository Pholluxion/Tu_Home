import 'package:flutter/material.dart';

extension FromContext on BuildContext {
  NavigationRailThemeData get railTheme => Theme.of(this).navigationRailTheme;
}
