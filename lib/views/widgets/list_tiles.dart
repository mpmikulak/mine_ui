import 'package:flutter/material.dart';
import 'package:mine_ui/data/server.dart';

class ServerListTileEntry extends StatelessWidget {
  const ServerListTileEntry({
    super.key,
    required this.server,
  });

  final Server server;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.storage),
      title: Text(server.name),
      subtitle: Text(server.path),
      onTap: () {
        // Handle server selection
        print('Selected server: ${server.name}');
      },
    );
  }
}
