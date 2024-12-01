import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  String getMessage(BuildContext context) {
    final message = ModalRoute.of(context)?.settings.arguments as String?;
    return message ?? 'no result';
  }

  @override
  Widget build(BuildContext context) {
    final message = getMessage(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Resultado'),
        ),
        body: Center(
          child: Text(message),
        ));
  }
}
