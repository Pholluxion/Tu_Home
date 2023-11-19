import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tu_home/app/app.dart';
import 'package:tu_home/ui/ui.dart';

import '../cubit/splash_cubit.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashLoaded) {
          const LoginRoute().replace(context);
        }
      },
      builder: (context, state) {
        return Center(
          child: Column(
            children: [
              const Spacer(),
              Assets.images.tuHomeLogo.image(width: 200).animate(
                    onComplete: (controller) => controller.repeat(),
                  )
                ..moveY(
                  duration: const Duration(milliseconds: 1000),
                  begin: -50,
                  end: 0,
                  curve: Curves.easeInOutCubicEmphasized,
                )
                ..then(duration: const Duration(milliseconds: 500))
                ..moveY(
                  duration: const Duration(milliseconds: 1000),
                  begin: 0,
                  end: -50,
                  curve: Curves.easeInOutCubicEmphasized,
                ),
              const Spacer(),
              if (state is SplashLoading) ...[
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
                const SizedBox(height: 20),
                Text(
                  state.message,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
              if (state is SplashError) ...[
                Text(state.message),
                const SizedBox(height: 20),
              ],
              const Spacer(),
            ],
          ),
        );
      },
    );
  }
}
