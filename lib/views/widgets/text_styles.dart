import 'package:flutter/material.dart';

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

Widget CategoryTitleText(String title) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
