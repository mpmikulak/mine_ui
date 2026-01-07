import 'package:flutter/material.dart';
import 'package:mine_ui/views/pages/developer_page.dart';

import 'package:mine_ui/views/widgets/text.dart';
import 'package:mine_ui/data/notifiers.dart';
import 'settings_page.dart';
import 'package:mine_ui/views/pages/add_server_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> servers = [];

  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomePageAppBar(),
      body: HomePageBody(),
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
              Divider(),
              NewServerButton(),
            ],
          );
        });
  }
}

class NewServerButton extends StatelessWidget {
  const NewServerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AddServerPage(),
          ),
        );
      },
      icon: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "New Server",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
          Icon(
            Icons.add,
          ),
        ],
      ),
    );
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
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
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
