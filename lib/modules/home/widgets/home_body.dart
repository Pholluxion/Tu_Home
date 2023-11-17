import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/home_cubit.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return Text(state.customProperty);
                },
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<HomeCubit>().yourCustomFunction();
                },
                child: const Text('Button'),
              ),
            ],
          ),
        );
      },
    );
  }
}
