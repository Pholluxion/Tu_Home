import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:tu_home/modules/login/login.dart';
import 'package:tu_home/modules/signup/signup.dart';
import 'package:tu_home/ui/widgets/widgets.dart';

part 'router.g.dart';

GoRouter router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: $appRoutes,
);

@TypedGoRoute<HomeRoute>(path: '/')
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return AdaptivePage(
      small: Scaffold(
        appBar: AppBar(
          title: const Text('small'),
        ),
      ),
      medium: Scaffold(
        appBar: AppBar(
          title: const Text('medium'),
        ),
      ),
      large: Scaffold(
        appBar: AppBar(
          title: const Text('large'),
        ),
      ),
    );
  }
}

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginPage();
  }
}

@TypedGoRoute<SignUpRoute>(path: '/signup')
class SignUpRoute extends GoRouteData {
  const SignUpRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignupPage();
  }
}

final List<Widget> children = List<Widget>.generate(10, (int index) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      color: const Color.fromARGB(255, 255, 201, 197),
      height: 400,
    ),
  );
});

final Widget trailingNavRail = Column(
  children: <Widget>[
    const Divider(color: Colors.black),
    const SizedBox(height: 10),
    const Row(
      children: <Widget>[
        SizedBox(width: 27),
        Text('Folders', style: TextStyle(fontSize: 16)),
      ],
    ),
    const SizedBox(height: 10),
    Row(
      children: <Widget>[
        const SizedBox(width: 16),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.folder_copy_outlined),
          iconSize: 21,
        ),
        const SizedBox(width: 21),
        const Flexible(
          child: Text(
            'Freelance',
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
    const SizedBox(height: 12),
    Row(
      children: <Widget>[
        const SizedBox(width: 16),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.folder_copy_outlined),
          iconSize: 21,
        ),
        const SizedBox(width: 21),
        const Flexible(
          child: Text(
            'Mortgage',
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
    const SizedBox(height: 12),
    Row(
      children: <Widget>[
        const SizedBox(width: 16),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.folder_copy_outlined),
          iconSize: 21,
        ),
        const SizedBox(width: 21),
        const Flexible(
          child: Text('Taxes', overflow: TextOverflow.ellipsis),
        ),
      ],
    ),
    const SizedBox(height: 12),
    Row(
      children: <Widget>[
        const SizedBox(width: 16),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.folder_copy_outlined),
          iconSize: 21,
        ),
        const SizedBox(width: 21),
        const Flexible(
          child: Text('Receipts', overflow: TextOverflow.ellipsis),
        ),
      ],
    ),
  ],
);

const List<NavigationDestination> destinations = <NavigationDestination>[
  NavigationDestination(
    label: 'Inbox',
    icon: Icon(Icons.inbox_outlined),
    selectedIcon: Icon(Icons.inbox),
  ),
  NavigationDestination(
    label: 'Articles',
    icon: Icon(Icons.article_outlined),
    selectedIcon: Icon(Icons.article),
  ),
  NavigationDestination(
    label: 'Chat',
    icon: Icon(Icons.chat_outlined),
    selectedIcon: Icon(Icons.chat),
  ),
  NavigationDestination(
    label: 'Video',
    icon: Icon(Icons.video_call_outlined),
    selectedIcon: Icon(Icons.video_call),
  ),
];
