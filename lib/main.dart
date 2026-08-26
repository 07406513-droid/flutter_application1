import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mini Task Tracker')),
      body: const Center(child: Text('Tasks')),
    );
  }
}

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task Details')),
      body: const Center(child: Text('Task details')),
    );
  }
}

class MarkStatusScreen extends StatelessWidget {
  const MarkStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mark Status')),
      body: const Center(child: Text('Mark status')),
    );
  }
}
