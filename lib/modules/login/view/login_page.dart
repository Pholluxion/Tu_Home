import 'package:flutter/material.dart';

import 'package:tu_home/modules/login/widgets/widgets.dart';
import 'package:tu_home/ui/ui.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const route = '/login';

  @override
  Widget build(BuildContext context) {
    return const LoginView();
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: const LoginBody(),
    );
  }
}
