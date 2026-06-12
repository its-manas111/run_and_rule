import 'package:flutter/material.dart';
import '../widgets/stat_card.dart';
import 'run_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 40),

              const Icon(
                Icons.directions_run,
                size: 80,
                color: Colors.green,
              ),

              const SizedBox(height: 20),

              const Text(
                "RUN & RULE",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const RunScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "START RUN",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              const Row(
                children: [
                  Expanded(
                    child: StatCard(
                      title: "Territory",
                      value: "12.4 km²",
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: StatCard(
                      title: "Runs",
                      value: "18",
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12),

              const Row(
                children: [
                  Expanded(
                    child: StatCard(
                      title: "Rank",
                      value: "Explorer",
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: StatCard(
                      title: "XP",
                      value: "320",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}