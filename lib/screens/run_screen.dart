import 'dart:async';
import 'package:flutter/material.dart';
import '../features/map/map_screen.dart';

class RunScreen extends StatefulWidget {
  const RunScreen({super.key});

  @override
  State<RunScreen> createState() => _RunScreenState();
}

class _RunScreenState extends State<RunScreen> {
  int seconds = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(
      const Duration(seconds: 1),
          (_) {
        setState(() {
          seconds++;
        });
      },
    );
  }

  String get formattedTime {
    final h = (seconds ~/ 3600).toString().padLeft(2, '0');
    final m = ((seconds % 3600) ~/ 60).toString().padLeft(2, '0');
    final s = (seconds % 60).toString().padLeft(2, '0');

    return "$h:$m:$s";
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Widget stat(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(label),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            Container(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceAround,
                children: [
                  stat("Time", formattedTime),
                  stat("Distance", "0.0 km"),
                  stat("Territory", "0 m²"),
                ],
              ),
            ),

            const Expanded(
              child: MapScreen(),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text("PAUSE"),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("FINISH"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}