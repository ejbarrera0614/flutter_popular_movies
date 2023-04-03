import 'package:flutter/material.dart';

class TextInfoCard extends StatelessWidget {
  const TextInfoCard({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.color = Colors.white,
    this.paddingLeft = 12,
  });
  final String text;
  final Color? color;
  final double? fontSize;
  final double? paddingLeft;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: paddingLeft!),
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: color, fontSize: fontSize),
      ),
    );
  }
}
