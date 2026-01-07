import 'package:flutter/material.dart';

import 'package:mine_ui/views/widgets/ram_slider.dart';
import 'package:mine_ui/data/databases/settings.dart' as settings;
import 'package:mine_ui/views/widgets/text_styles.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  final String name = "Settings Page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CategoryTitleText("Default RAM Allocation:"),
            RamSlider(),
            DarkModeSwitch()
          ],
        ),
      ),
    );
  }
}

class DarkModeSwitch extends StatefulWidget {
  const DarkModeSwitch({super.key});

  @override
  State<DarkModeSwitch> createState() => _DarkModeSwitchState();
}

class _DarkModeSwitchState extends State<DarkModeSwitch> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text(
        "Dark Mode",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      value: settings.darkMode,
      onChanged: (bool value) {
        setState(() {
          settings.darkMode = value;
        });
      },
    );
  }
}
