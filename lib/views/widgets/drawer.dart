import 'package:flutter/material.dart';

import 'package:mine_ui/views/pages/add_server_page.dart';
import 'package:mine_ui/views/widgets/text.dart';
import 'package:mine_ui/views/widgets/list_tiles.dart';
import 'package:mine_ui/data/databases/servers.dart' as servers;
import 'package:mine_ui/data/server.dart';

class MineUIDrawer extends StatelessWidget {
  const MineUIDrawer({
    super.key,
  });

  List<Widget> _generateServerListTiles() {
    List<Widget> serverTiles = [];
    for (Server server in servers.serverList) {
      serverTiles.add(ServerListTileEntry(server: server));
    }
    return serverTiles;
  }

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      children: [
        MineUIDrawerHeader(),
        ..._generateServerListTiles(),
        Divider(),
        NewServerButton(),
      ],
    );
  }
}

class MineUIDrawerHeader extends StatelessWidget {
  const MineUIDrawerHeader({
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
