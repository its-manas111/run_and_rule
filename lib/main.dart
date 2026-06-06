import 'package:flutter/material.dart';
import 'features/map/map_screen.dart';

void main() {
  runApp(const RunAndRuleApp());
}

class RunAndRuleApp extends StatelessWidget {
  const RunAndRuleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Run & Rule',
      theme: ThemeData.dark(),
      home: const MapScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Run & Rule")),
      body: const Center(
        child: Text(
          "Ready to conquer territory 🏃‍♂️",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}