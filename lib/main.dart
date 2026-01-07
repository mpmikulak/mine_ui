import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import 'views/pages/home_page.dart';
import 'data/server.dart';

void main() async {
  await initializeHive();
  runApp(const MyApp());
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// initializeHive sets up Hive for local data storage.
// An adapter for each custom class must be registered before opening boxes.
// The boxes for custom classes and raw data must also be opened.
Future<void> initializeHive() async {
  // Initialize Hive first
  await Hive.initFlutter();

  // Register adapters
  Hive.registerAdapter(ServerAdapter());

  // Open necessary boxes
  await Hive.openBox<Server>('servers');
  await Hive.openBox('globalSettings');
}
