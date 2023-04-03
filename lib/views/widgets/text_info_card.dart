import 'package:flutter/material.dart';

class TextInfoCard extends StatelessWidget {
  const TextInfoCard(
    this.text, {
    super.key,
    this.fontSize = 16,
    this.color = Colors.white,
    this.paddingLeft = 12,
    this.overflow = TextOverflow.ellipsis,
  });
  final String text;
  final Color? color;
  final double? fontSize;
  final double? paddingLeft;
  final TextOverflow? overflow;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: paddingLeft!),
      child: Text(
        text,
        overflow: overflow,
        style: TextStyle(
            decoration: TextDecoration.none,
            color: color,
            fontSize: fontSize,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
