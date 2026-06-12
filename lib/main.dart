import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const RunAndRuleApp());
}

class RunAndRuleApp extends StatelessWidget {
  const RunAndRuleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Run & Rule',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
      ),
      home: const HomeScreen(),
    );
  }
}