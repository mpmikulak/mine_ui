import 'package:flutter/material.dart';
import 'package:mine_ui/views/pages/developer_page.dart';

import 'package:mine_ui/views/widgets/text.dart';
import 'package:mine_ui/views/pages/settings_page.dart';
import 'package:mine_ui/views/widgets/drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> servers = [];

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomePageAppBar(),
      body: HomePageBody(),
      drawer: MineUIDrawer(),
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
          Scaffold.of(context).openDrawer();
        },
        icon: Icon(Icons.menu),
      ),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const AppBarTitleText("Home Page"),
      actions: [
        IconButton(
          onPressed: () {
            _navigateTo(
              context,
              DeveloperPage(),
            );
          },
          icon: Icon(Icons.handyman),
          tooltip: "Developer Tools",
        ),
        IconButton(
          onPressed: () {
            _navigateTo(
              context,
              SettingsPage(),
            );
          },
          icon: Icon(Icons.settings),
        ),
      ],
    );
  }

  Future<dynamic> _navigateTo(BuildContext context, Widget destination) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => destination,
      ),
    );
  }
}

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Home page placeholder"),
        ],
      ),
    );
  }
}
