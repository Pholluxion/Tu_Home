import 'package:carousel_slider/carousel_slider.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tu_home/app/ui/ui.dart';

import '../cubit/cubit.dart';

class PropertyBody extends StatelessWidget {
  const PropertyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertyCubit, PropertyState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            const SliverAppBar(elevation: 5.0, pinned: true),
            if (state is PropertyLoaded) ...[
              SliverToBoxAdapter(
                child: _VerticalSliderDemo(
                  images: state.images.map((e) => e.url).toList(),
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Imágenes',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
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
    return CarouselSlider(
      options: CarouselOptions(
        scrollDirection: Axis.horizontal,
        autoPlay: true,
      ),
      items: images
          .map(
            (item) => FastCachedImage(
              url: item,
              fit: BoxFit.cover,
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
    );
  }
}
