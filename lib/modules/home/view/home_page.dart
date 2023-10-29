import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tu_home/modules/home/widgets/home_body.dart';

import '../cubit/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: const Scaffold(
        body: HomeView(),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeBody();
  }
}
