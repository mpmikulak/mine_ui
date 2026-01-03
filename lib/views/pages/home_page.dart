import 'package:flutter/material.dart';
import 'dart:io';

import 'package:mine_ui/views/widgets/text_styles.dart';
import 'package:mine_ui/data/notifiers.dart';
import 'settings_page.dart';
import 'package:mine_ui/data/server.dart';
import 'package:mine_ui/views/widgets/server_list_tile_entry.dart';
import 'package:mine_ui/data/databases/settings.dart' as settings;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<String> servers = [];

  void _incrementCounter() {
    setState(() {
//      settings.maxServerRam += 256;
      _counter++;
    });
  }

  void scanServers() {
    // Placeholder for server scanning logic
    try {
      Directory dir = Directory("./servers");
      print('Scanning for servers...');
    } catch (e) {
      print('Error scanning servers: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomePageAppBar(),
      body: HomePageBody(counter: _counter),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      drawer: HomePageDrawer(),
    );
  }
}

class HomePageDrawer extends StatelessWidget {
  HomePageDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: serverListNotifier,
        builder: (context, value, child) {
          return NavigationDrawer(
            children: [
              HomePageDrawerHeader(),
              for (var server in value) ServerListTileEntry(server: server),
            ],
          );
        });
  }
}

class HomePageDrawerHeader extends StatelessWidget {
  const HomePageDrawerHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DrawerHeaderText(text: 'Menu'),
              DrawerHeaderSubtext(text: 'Select an option'),
            ],
          ),
        ],
      ),
    );
  }
}

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          // How does this work?
          derpolate();
          Scaffold.of(context).openDrawer();
        },
        icon: Icon(Icons.handyman),
      ),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text('Home Page'),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsPage(),
              ),
            );
          },
          icon: Icon(Icons.settings),
        ),
      ],
    );
  }

  void derpolate() {
    List<Server> servers = [];
    try {
      Directory dir = Directory("./servers");
      print('Derpolating servers...');

      for (var entity in dir.listSync()) {
        if (entity is File) {
          print("Skipping file: ${entity.path}");
          continue;
        } else if (entity is Directory) {
          print("Found server directory: ${entity.path}");
          servers.add(Server(entity.path));
        }
      }
    } catch (e) {
      print('Error derpolating servers: $e');
    }
    serverListNotifier.value = servers;
  }
}

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    super.key,
    required int counter,
  }) : _counter = counter;

  final int _counter;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
