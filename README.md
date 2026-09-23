Flutter Navigation & State Management
Separated code sections plus a complete main.dart file based on the provided Flutter exam
code.
What this app demonstrates: a stateful counter, navigation from Home to Detail, constructor-based data
passing, a returned navigation value, and UI rebuilding with setState().
1. Import and main()
import 'package:flutter/material.dart';
void main() => runApp(const MyApp());
Imports Flutter Material widgets and launches the application using MyApp.
2. MyApp
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
    );
  }
}
MyApp is the root widget. MaterialApp sets HomeScreen as the first screen.
3. HomeScreen
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
HomeScreen is stateful because the counter and the last returned message can change while the app
is running.
4. State Variables + Increment Function
class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;
  String _lastMessage = "None yet";
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
The variables _counter and _lastMessage are owned by _HomeScreenState. setState() causes Flutter to
rebuild the affected UI after the counter changes.
5. Open Detail Screen + Pass Data
Future<void> _openDetail() async {
  final result = await Navigator.push(
    context,
    MaterialPageRoute(
Page 1
Flutter Navigation & State Management - Code Guide
      builder: (context) => DetailScreen(
        count: _counter,
      ),
    ),
  );
  if (result != null) {
    setState(() {
      _lastMessage = result as String;
    });
  }
}
Navigator.push opens DetailScreen. The current counter value is passed forward through the
DetailScreen constructor. The returned value is awaited, checked for null, cast to String, and then
stored in _lastMessage.
6. HomeScreen Interface
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text("Home"),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Counter: $_counter"),
          Text("Last message: $_lastMessage"),
          ElevatedButton(
            onPressed: _incrementCounter,
            child: const Text("Increment"),
          ),
          ElevatedButton(
            onPressed: _openDetail,
            child: const Text("Go to Detail"),
          ),
        ],
      ),
    ),
  );
}
}
This builds the visible Home screen: an AppBar, two Text widgets, and two buttons. One button
increments the counter; the other opens the Detail screen.
7. DetailScreen
class DetailScreen extends StatelessWidget {
  final int count;
  const DetailScreen({
    super.key,
    required this.count,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
      ),
      body: Center(
        child: Column(
Page 2
Flutter Navigation & State Management - Code Guide
          children: [
            Text("Received count: $count"),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  "Returned from Detail!",
                );
              },
              child: const Text("Send Back & Return"),
            ),
          ],
        ),
      ),
    );
  }
}
DetailScreen receives count through its constructor and displays it. Navigator.pop closes the route and
sends the string "Returned from Detail!" back to HomeScreen.
Page 3
Flutter Navigation & State Management - Code Guide
Complete main.dart
Copy this entire code into lib/main.dart in a Flutter project.
import 'package:flutter/material.dart';
void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;
  String _lastMessage = "None yet";
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  Future<void> _openDetail() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(
          count: _counter,
        ),
      ),
    );
    if (result != null) {
      setState(() {
        _lastMessage = result as String;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Counter: $_counter"),
            Text("Last message: $_lastMessage"),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Text("Increment"),
            ),
Page 4
Flutter Navigation & State Management - Code Guide
            ElevatedButton(
              onPressed: _openDetail,
              child: const Text("Go to Detail"),
            ),
          ],
        ),
      ),
    );
  }
}
class DetailScreen extends StatelessWidget {
  final int count;
  const DetailScreen({
    super.key,
    required this.count,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Received count: $count"),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  "Returned from Detail!",
                );
              },
              child: const Text("Send Back & Return"),
            ),
          ],
        ),
      ),
    );
  }
}
Exam topics connected to this code
The provided exam asks about the full widget tree, forward navigation and data passing, return-value
navigation, state management, and the complete execution trace from app launch through
incrementing, opening Detail, and returning to Home.
Page 5
Flutter Navigation & State Management - Code Guide