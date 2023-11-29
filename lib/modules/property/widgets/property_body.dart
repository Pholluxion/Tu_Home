import 'package:carousel_slider/carousel_slider.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tu_home/app/ui/ui.dart';
import 'package:tu_home/data/data.dart';

import '../cubit/cubit.dart';

class PropertyBody extends StatelessWidget {
  const PropertyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertyCubit, PropertyState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            if (state is PropertyLoading) ...[const _PropertyLoading()],
            if (state is PropertyLoaded) ...[
              SliverAppBar(
                elevation: 5.0,
                pinned: true,
                leading: BackButton(color: context.primaryColor),
                backgroundColor: context.canvasColor,
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: context.canvasColor,
                  height: context.height * 0.25,
                  child: _VerticalSliderDemo(
                    images: state.images.map((e) => e.url).toList(),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Chip(
                        label: Text(
                          PropertyType.values
                              .firstWhere(
                                (e) => e.id == state.property.typeOfProperty,
                              )
                              .name,
                          style: context.textTheme.bodyLarge,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.property.name,
                            style: context.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            Utils.toCopFormat(state.property.price),
                            style: context.textTheme.headlineSmall?.copyWith(
                              color: context.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        'Dirección',
                        style: context.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        state.property.address,
                        style: context.textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        'Descripción',
                        style: context.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        PropertyType.values
                            .firstWhere(
                              (e) => e.id == state.property.typeOfProperty,
                            )
                            .description,
                        style: context.textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        'Características',
                        style: context.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${state.property.squareFeet} m2',
                        style: context.textTheme.bodyLarge,
                      ),
                      Text(
                        '${state.property.bedrooms} habitaciones',
                        style: context.textTheme.bodyLarge,
                      ),
                      Text(
                        '${state.property.bathrooms} baños',
                        style: context.textTheme.bodyLarge,
                      ),
                      Text(
                        '${state.property.garage ? 1 : 0} garajes',
                        style: context.textTheme.bodyLarge,
                      ),
                      Text(
                        '${state.property.patio ? 1 : 0} patios',
                        style: context.textTheme.bodyLarge,
                      ),
                      Text(
                        '${state.property.elevator ? 1 : 0} elevadores',
                        style: context.textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        'Documentos',
                        style: context.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Certificado de libertad',
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: context.primaryColor,
                        ),
                      ),
                      Text(
                        'Certificado de tradición',
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: context.primaryColor,
                        ),
                      ),
                      Text(
                        'Certificado de paz y salvo',
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: context.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 40.0),
                    ],
                  ),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}

class _VerticalSliderDemo extends StatelessWidget {
  final List<String> images;

  const _VerticalSliderDemo({
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.0),
        child: CarouselSlider(
          options: CarouselOptions(
            scrollDirection: Axis.horizontal,
            autoPlay: true,
          ),
          items: images
              .map(
                (item) => FastCachedImage(
                  url: item,
                  fit: BoxFit.fill,
                  width: context.width,
                  loadingBuilder: (p0, p1) {
                    return Shimmer.fromColors(
                      baseColor: context.canvasColor,
                      highlightColor: context.primaryColor,
                      child: Container(
                        color: Colors.white10,
                        width: double.infinity,
                        height: context.height * 0.25,
                      ),
                    );
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _PropertyLoading extends StatelessWidget {
  const _PropertyLoading();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: context.width,
        height: context.height,
        color: Colors.black.withOpacity(0.5),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Descargando información...',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20.0),
              CircularProgressIndicator(
                color: context.primaryColor,
              ),
            ],
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
