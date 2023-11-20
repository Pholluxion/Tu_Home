import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:tu_home/modules/login/cubit/login_cubit.dart';
import 'package:tu_home/ui/ui.dart';

import '../cubit/home_cubit.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LogOutSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Cierre de sesión exitoso'),
              backgroundColor: Colors.green,
            ),
          );

          context.pop();
        }
      },
      builder: (context, loginState) {
        return CustomScrollView(
          slivers: [
            if (loginState is! LoginLoading) ...[
              const _HomeAppBar(),
              const _HomeBody(),
            ],
            if (loginState is LoginLoading) const _LogOutLoading(),
          ],
        );
      },
    );
  }
}

class _HomeAppBar extends StatelessWidget {
  const _HomeAppBar();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0.0,
      pinned: true,
      leading: const Padding(
        padding: EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.person,
            color: Colors.grey,
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.notifications_active_outlined,
            color: Colors.grey,
          ),
          onPressed: () {},
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: VerticalDivider(
            color: Colors.grey,
            width: 4.0,
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.exit_to_app,
            color: Colors.grey,
          ),
          onPressed: () => context.read<LoginCubit>().logout(),
        ),
      ],
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Bienvenido a Tu Home',
            style: TextStyle(color: Colors.grey),
          ),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return Text(
                state is LoginSuccess ? state.userResponse.name : 'Usuario',
                style: const TextStyle(color: Colors.grey, fontSize: 12.0),
              );
            },
          ),
        ],
      ),
      backgroundColor: Theme.of(context).canvasColor,
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: true,
      fillOverscroll: true,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoaded) {
            if (state.contracts.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.images.enpty.image(),
                  const SizedBox(height: 16.0),
                  Text(
                    'Parece que no tienes inmuebles.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                  ),
                ],
              );
            } else {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.contracts.length,
                itemBuilder: (context, index) {
                  final contract = state.contracts[index];
                  final image = state.images.firstWhere(
                    (image) => image.property == contract.propertyId,
                  );

                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Card(
                      color: Theme.of(context).canvasColor,
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: FastCachedImage(
                                url: image.url,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  toCopFormat(contract.deposit),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  toCopFormat(contract.rent),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  contract.status,
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          } else if (state is HomeError) {
            return Center(
              child: Text(
                state.message,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class _LogOutLoading extends StatelessWidget {
  const _LogOutLoading();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: context.width,
        height: context.height,
        color: Colors.black.withOpacity(0.5),
        child: Center(
          child: CircularProgressIndicator(
            color: context.primaryColor,
          ),
        ),
      ).animate().fade(
            begin: 0,
            end: 1,
            duration: const Duration(milliseconds: 500),
          ),
    );
  }
}

String toCopFormat(String value) {
  final formatter = NumberFormat.currency(
    locale: 'es_CO',
    symbol: '\$',
    decimalDigits: 0,
  );

  return formatter.format(double.parse(value));
}
