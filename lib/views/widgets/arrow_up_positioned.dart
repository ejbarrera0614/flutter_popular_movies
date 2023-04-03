import 'package:flutter/material.dart';

class ArrowUpButtonWidget extends StatelessWidget {
  const ArrowUpButtonWidget(
      {super.key, required this.onPressed, bottom, right});
  final Function()? onPressed;
  final double posBottom = 20;
  final double posRight = 20;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: posBottom,
        right: posRight,
        child: FloatingActionButton(
          onPressed: onPressed,
          backgroundColor: Colors.transparent,
          child: const Icon(
            Icons.arrow_circle_up,
            size: 48,
            color: Color(0xff4cc9fe),
          ),
        ));
  }
}
