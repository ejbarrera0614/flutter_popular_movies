import 'package:flutter/material.dart';

class TextStarIcon extends StatelessWidget {
  const TextStarIcon(
    this.text, {
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
            decoration: TextDecoration.none,
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.white),
        text: text,
        children: const [
          WidgetSpan(child: SizedBox(width: 10)),
          WidgetSpan(
              child: Icon(
            Icons.star_border,
            color: Colors.yellowAccent,
          ))
        ],
      ),
    );
  }
}
