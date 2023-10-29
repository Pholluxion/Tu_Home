import 'package:flutter/material.dart';

import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tu_home/ui/ui.dart';

import 'cubit/adaptive_cubit.dart';

class AdaptivePage extends StatelessWidget {
  const AdaptivePage({
    super.key,
    this.children,
    this.destinations,
    this.trailingNavRail,
    this.small,
    this.medium,
    this.large,
  });

  final List<NavigationDestination>? destinations;
  final List<Widget>? children;
  final Widget? trailingNavRail;
  final Widget? small;
  final Widget? medium;
  final Widget? large;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdaptiveCubit(),
      child: AdaptiveView(
        destinations: destinations,
        trailingNavRail: trailingNavRail,
        large: large,
        small: small,
        medium: medium,
        children: children,
      ),
    );
  }
}

class AdaptiveView extends StatelessWidget {
  const AdaptiveView({
    super.key,
    required this.destinations,
    required this.trailingNavRail,
    required this.children,
    required this.small,
    required this.medium,
    required this.large,
  });

  final List<NavigationDestination>? destinations;
  final Widget? trailingNavRail;
  final List<Widget>? children;
  final Widget? small;
  final Widget? medium;
  final Widget? large;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdaptiveCubit, AdaptiveState>(
      builder: (context, state) {
        return AdaptiveLayout(
          primaryNavigation: destinations != null
              ? SlotLayout(
                  config: <Breakpoint, SlotLayoutConfig>{
                    Breakpoints.medium: SlotLayout.from(
                      inAnimation: AdaptiveScaffold.leftOutIn,
                      key: const Key('Primary Navigation Medium'),
                      builder: (_) => AdaptiveScaffold.standardNavigationRail(
                        selectedIndex: state.selectedNavigation,
                        onDestinationSelected:
                            context.read<AdaptiveCubit>().setIndex,
                        leading: const Icon(Icons.menu),
                        destinations: destinations!
                            .map((_) => AdaptiveScaffold.toRailDestination(_))
                            .toList(),
                        backgroundColor: context.railTheme.backgroundColor,
                        selectedIconTheme: context.railTheme.selectedIconTheme,
                        unselectedIconTheme:
                            context.railTheme.unselectedIconTheme,
                        selectedLabelTextStyle:
                            context.railTheme.selectedLabelTextStyle,
                        unSelectedLabelTextStyle:
                            context.railTheme.unselectedLabelTextStyle,
                      ),
                    ),
                    Breakpoints.large: SlotLayout.from(
                      key: const Key('Primary Navigation Large'),
                      inAnimation: AdaptiveScaffold.leftOutIn,
                      builder: (_) => AdaptiveScaffold.standardNavigationRail(
                        selectedIndex: state.selectedNavigation,
                        onDestinationSelected:
                            context.read<AdaptiveCubit>().setIndex,
                        extended: true,
                        leading: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'REPLY',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 201, 197)),
                            ),
                            Icon(Icons.menu_open)
                          ],
                        ),
                        destinations: destinations!
                            .map((_) => AdaptiveScaffold.toRailDestination(_))
                            .toList(),
                        trailing: trailingNavRail,
                        backgroundColor: context.railTheme.backgroundColor,
                        selectedIconTheme: context.railTheme.selectedIconTheme,
                        unselectedIconTheme:
                            context.railTheme.unselectedIconTheme,
                        selectedLabelTextStyle:
                            context.railTheme.selectedLabelTextStyle,
                        unSelectedLabelTextStyle:
                            context.railTheme.unselectedLabelTextStyle,
                      ),
                    ),
                  },
                )
              : null,
          body: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.small: SlotLayout.from(
                key: const Key('Body Small'),
                builder: (_) =>
                    small ??
                    const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
              ),
              Breakpoints.mediumAndUp: SlotLayout.from(
                key: const Key('Body Medium'),
                builder: (_) =>
                    medium ??
                    const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
              )
            },
          ),
          bottomNavigation: destinations != null
              ? SlotLayout(
                  config: <Breakpoint, SlotLayoutConfig>{
                    Breakpoints.small: SlotLayout.from(
                      key: const Key('Bottom Navigation Small'),
                      inAnimation: AdaptiveScaffold.bottomToTop,
                      outAnimation: AdaptiveScaffold.topToBottom,
                      builder: (_) =>
                          AdaptiveScaffold.standardBottomNavigationBar(
                        destinations: destinations!,
                        currentIndex: state.selectedNavigation,
                        onDestinationSelected:
                            context.read<AdaptiveCubit>().setIndex,
                      ),
                    )
                  },
                )
              : null,
        );
      },
    );
  }
}
