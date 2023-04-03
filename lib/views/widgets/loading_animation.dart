import 'package:flutter/material.dart';

class LoadingAnimation extends StatelessWidget {
  final bool isLoading;
  final double? size = 40;
  const LoadingAnimation({super.key, required this.isLoading, size});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isLoading ? 1 : 0,
      duration: const Duration(milliseconds: 500),
      child: SizedBox(
        width: size,
        height: size,
        child: const CircularProgressIndicator.adaptive(
          strokeWidth: 8,
          backgroundColor: Colors.transparent,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
    );
  }
}
