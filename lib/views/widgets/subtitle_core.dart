import 'package:flutter/material.dart';

class SubtitleCore extends StatelessWidget {
  const SubtitleCore({
    super.key,
    required this.subtitle,
  });

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: const TextStyle(
          decoration: TextDecoration.none,
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Colors.white),
    );
  }
}
