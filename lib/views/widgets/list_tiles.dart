import 'package:flutter/material.dart';
import 'package:mine_ui/data/server.dart';
import 'package:mine_ui/views/widgets/text.dart' as text;

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
      onTap: () {
        // Handle server selection
        print('Selected server: ${server.name}');
      },
    );
  }
}

class DevOptionsListTile extends StatelessWidget {
  const DevOptionsListTile({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.developer_mode),
      title: text.ListTileEntryText(text: title),
      onTap: onTap,
    );
  }
}
