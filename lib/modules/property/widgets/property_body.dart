import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit.dart';

class PropertyBody extends StatelessWidget {
  const PropertyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertyCubit, PropertyState>(
      builder: (context, state) {
        if (state is PropertyLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is PropertyLoaded) {
          return ListView(
            children: [
              Text(state.property.name),
              Text(state.property.address),
              Text(state.property.price.toString()),
            ],
          );
        }

        return Center(
          child: Text(state.toString()),
        );
      },
    );
  }
}
