/// A collection of text widgets used throughout the app for consistent styling.
/// Preffer using these widgets instead of raw Text widgets for titles and headers.
library;

import 'package:flutter/material.dart';

/// A styled text widget for a drawer header.
class DrawerHeaderText extends StatelessWidget {
  const DrawerHeaderText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}

/// A styled text widget for the drawer subheader.
class DrawerHeaderSubtext extends StatelessWidget {
  const DrawerHeaderSubtext({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w100,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}

/// A styled text widget for category titles, such as in the settings page, or
/// where different categories are displayed on the same page.
class CategoryTitleText extends StatelessWidget {
  const CategoryTitleText({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class AppBarTitleText extends StatelessWidget {
  const AppBarTitleText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class ListTileEntryText extends StatelessWidget {
  const ListTileEntryText({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
