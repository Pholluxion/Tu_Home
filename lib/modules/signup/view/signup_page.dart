import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tu_home/modules/signup/cubit/signup_cubit.dart';
import 'package:tu_home/modules/signup/widgets/signup_body.dart';
import 'package:tu_home/app/ui/ui.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  static const route = '/signup';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: const SignupView(),
    );
  }
}

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: const SignupBody(),
    );
  }
}
