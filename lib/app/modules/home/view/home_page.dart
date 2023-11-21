import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../login/cubit/cubit.dart';
import '../cubit/cubit.dart';
import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const route = '/home';

  @override
  Widget build(BuildContext context) {
    final loginState = context.read<LoginCubit>().state;
    return BlocProvider(
      create: (context) => HomeCubit()
        ..getContractUserId(
          loginState is LoginSuccess ? loginState.userResponse.id : 0,
          loginState is LoginSuccess ? loginState.token : '',
        ),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: const HomeBody(),
        bottomNavigationBar: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return Visibility(
              visible: state is! LoginLoading,
              child: BottomNavigationBar(
                currentIndex: 0,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Inicio',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.dashboard),
                    label: 'Dashboard',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.notifications),
                    label: 'Notificaciones',
                  ),
                ],
              ),
            );
          },
        ),
      ),
      onWillPop: () => _onWillPop(context),
    );
  }

  Future<bool> _onWillPop(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('¿Desea cerrar sesión?'),
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
  }
}
