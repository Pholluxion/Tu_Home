import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tu_home/modules/login/cubit/login_cubit.dart';
import 'package:tu_home/modules/property/cubit/property_cubit.dart';

import 'package:tu_home/modules/property/widgets/widgets.dart';

class PropertyPage extends StatelessWidget {
  const PropertyPage({
    super.key,
    required this.id,
  });

  final int id;

  static const String route = '/property';

  @override
  Widget build(BuildContext context) {
    final loginState = context.read<LoginCubit>().state;
    return BlocProvider(
      create: (context) => PropertyCubit()
        ..getProperty(
          id,
          loginState is LoginSuccess ? loginState.token : '',
        ),
      child: const PropertyView(),
    );
  }
}

class PropertyView extends StatelessWidget {
  const PropertyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PropertyView'),
      ),
      body: const PropertyBody(),
    );
  }
}
