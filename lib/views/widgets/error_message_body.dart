import 'package:flutter/material.dart';

class ErrorMessageBody extends StatelessWidget {
  final String message;
  final Function retryFunction;
  const ErrorMessageBody({
    super.key,
    required this.message,
    required this.retryFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              message != '' ? message : 'Error desconocido',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              child: IconButton(
                iconSize: 60,
                onPressed: () => retryFunction(),
                icon: const Icon(
                  Icons.restart_alt,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
