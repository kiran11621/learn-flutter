import 'package:flutter/material.dart';
import 'package:learn_flutter/buttons.dart';
import 'package:learn_flutter/calculator.dart';
import 'package:learn_flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class Routes {
  static const String initialRoute = '/';
  static const String calculatorRoute = '/Calculator';
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const Calculator(),
      routes: {
        Routes.initialRoute: (context) => const Buttons(),
        Routes.calculatorRoute: (context) => const Calculator(),
      },
    );
  }
}
