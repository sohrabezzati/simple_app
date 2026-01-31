import 'package:flutter/material.dart';
import 'package:simple_app/core/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Simple App',
      routeInformationParser: AppRoutes.instance.router.routeInformationParser,
      routeInformationProvider:
          AppRoutes.instance.router.routeInformationProvider,
      routerDelegate: AppRoutes.instance.router.routerDelegate,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
    );
  }
}
