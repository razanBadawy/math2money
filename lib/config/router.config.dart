import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:math2money/screens/calculator.screen.dart';


final _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter  router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      name: 'calculator',
      path: '/',
      builder: (context, state) => CalculatorScreen(),

),

  ]
);