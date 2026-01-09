import 'package:flutter/material.dart';

import 'package:mine_ui/data/databases/settings.dart' show clearSettings;
import 'package:mine_ui/data/databases/servers.dart' show clearServers;
import 'package:mine_ui/views/widgets/text.dart';
import 'package:mine_ui/views/widgets/list_tiles.dart';

class DeveloperPage extends StatelessWidget {
  const DeveloperPage({super.key});

  /// A function that builds a list of developer tool widgets,
  /// including the category title and individual tool options.
  List<Widget> _buildDeveloperTools() {
    return <Widget>[
      // Category header for neatness
      const CategoryTitleText(text: "Database Tools"),

      // Reset buttons
      DevOptionsListTile(
        title: "Reset Settings Database",
        onTap: () {
          clearSettings();
        },
      ),
      DevOptionsListTile(
        title: "Reset Server Database",
        onTap: () {
          clearServers();
        },
      ),

      // Placeholder for future tools
      const CategoryTitleText(text: "New tools go here")
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitleText("Developer Page"),
      ),
      body: ListView(
        children: _buildDeveloperTools(),
      ),
    );
  }
}
