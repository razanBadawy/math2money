import 'package:flutter/material.dart';
import 'package:math2money/config/router.config.dart';
import 'package:math2money/service/network.service.dart';

void main() {
  NetworkClientService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'math2money',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: router,
    );
  }
}
