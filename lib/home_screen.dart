import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  final TextEditingController pesoController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String text = 'abc';
  void calculate() {
    String message = '';
    double peso = double.parse(widget.pesoController.text);
    double altura = double.parse(widget.alturaController.text);
    double imc = peso / (altura * altura);

    setState(() {});

    switch (imc) {
      case <= 18.5:
        message = 'Result: Underweight';
      case <= 24.9:
        message = 'Result: Normal';
      case <= 29.9:
        message = 'Result: Overweight';
      case <= 34.9:
        message = 'Result: Obesity I';
      case <= 39.9:
        message = 'Result: Obesity II';
      default:
        message = 'Result: Obesity III';
    }

    Navigator.pushNamed(context, '/result', arguments: message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Cálculo de IMC'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                controller: widget.pesoController,
                decoration: const InputDecoration(
                  labelText: 'Insira seu peso',
                  border: OutlineInputBorder(),
                ),
              ),
              TextFormField(
                controller: widget.alturaController,
                decoration: const InputDecoration(
                  labelText: 'Insira sua altura',
                  border: OutlineInputBorder(),
                ),
              ),
              OutlinedButton(
                onPressed: calculate,
                child: const Text('Calcular'),
              ),
            ],
          ),
        ));
  }
}
