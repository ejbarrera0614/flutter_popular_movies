import 'package:flutter/material.dart';

class TitleCore extends StatelessWidget {
  const TitleCore({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          decoration: TextDecoration.none,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white),
    );
  }
}
