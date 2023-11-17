import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tu_home/modules/signup/widgets/signup_body.dart';
import 'package:tu_home/ui/ui.dart';

import '../bloc/signup_bloc.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  static const route = '/signup';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupBloc(),
      child: const SignupView(),
    );
  }
}

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SignupBody(),
    );
  }
}
