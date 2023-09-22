import 'package:go_router/go_router.dart';

import 'package:tu_home/counter/counter.dart';

GoRouter goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const CounterPage(),
    )
  ],
);
