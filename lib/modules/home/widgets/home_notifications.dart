import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tu_home/app/ui/ui.dart';
import 'package:tu_home/modules/modules.dart';

class NotificationsBody extends StatelessWidget {
  const NotificationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          leading: SizedBox(),
          title: Text('Notificaciones'),
          floating: true,
          snap: true,
        ),
        SliverFillRemaining(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is HomeError) {
                return Center(
                  child: Text(state.message),
                );
              }

              if (state is HomeLoaded && state.notifications.isEmpty) {
                return const Center(
                  child: Text('No hay notificaciones'),
                );
              }

              if (state is HomeLoaded && state.notifications.isNotEmpty) {
                return ListView.builder(
                  itemCount: state.notifications.length,
                  itemBuilder: (context, index) {
                    final notification = state.notifications[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: ListTile(
                        leading: Icon(
                          Icons.notifications,
                          color: context.primaryColor,
                        ).animate(
                          onComplete: (controller) => controller.repeat(),
                        )..shake(),
                        title: Text(
                          notification.title,
                          style: context.textTheme.titleSmall,
                        ),
                        subtitle: Text(notification.description),
                      ),
                    );
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
        )
      ],
    );
  }
}
