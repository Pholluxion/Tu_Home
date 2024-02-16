import 'dart:io';

import 'package:flutter/material.dart';

import 'package:tu_home/app/ui/ui.dart';

import '../widgets/widgets.dart';

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
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) {
          return;
        }
        final bool? shouldPop = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('¿Desea salir de la aplicación?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Si'),
              ),
            ],
          ),
        );
        if (shouldPop ?? false) {
          exit(0);
        }
      },
      child: Scaffold(
        backgroundColor: context.scaffoldBackgroundColor,
        body: const LoginBody(),
      ),
    );
  }
}
