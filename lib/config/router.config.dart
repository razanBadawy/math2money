import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:math2money/screens/calculator.screen.dart';
import 'package:math2money/screens/currency_convertor.screen.dart';
import 'package:math2money/screens/navbar.screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/calculator',
  routes: [
    StatefulShellRoute(
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: 'calculator',
              path: '/calculator',
              builder: (context, state) => const CalculatorScreen(),
              routes: <RouteBase>[],
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              name: 'currency-converter',
              path: '/currency-converter',
              builder: (context, state) => const CurrencyConvertorScreen(),
              routes: <RouteBase>[],
            ),
          ],
        ),
      ],
      navigatorContainerBuilder:
          (
            BuildContext context,
            StatefulNavigationShell navigationShell,
            List<Widget> children,
          ) {
            return IndexedStack(
              index: navigationShell.currentIndex,
              children: children,
            );
          },
      builder: (context, state, navigationShell) => NavbarScreen(
        screen: navigationShell,
        index: navigationShell.currentIndex,
      ),
    ),
  ],
);
