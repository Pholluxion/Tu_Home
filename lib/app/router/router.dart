import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:tu_home/modules/home/home.dart';
import 'package:tu_home/modules/login/login.dart';
import 'package:tu_home/modules/property/property.dart';
import 'package:tu_home/modules/signup/signup.dart';
import 'package:tu_home/modules/splash/splash.dart';

part 'router.g.dart';

GoRouter router = GoRouter(
  initialLocation: SplashPage.route,
  debugLogDiagnostics: true,
  routes: $appRoutes,
);

@TypedGoRoute<LoginRoute>(path: LoginPage.route)
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginPage();
  }
}

@TypedGoRoute<SignUpRoute>(path: SignupPage.route)
class SignUpRoute extends GoRouteData {
  const SignUpRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignupPage();
  }
}

@TypedGoRoute<HomeRoute>(path: HomePage.route)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

@TypedGoRoute<SplashRoute>(path: SplashPage.route)
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashPage();
  }
}

@TypedGoRoute<PropertyRoute>(path: PropertyPage.route)
class PropertyRoute extends GoRouteData {
  const PropertyRoute({required this.id});

  final int id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return PropertyPage(id: id);
  }
}
