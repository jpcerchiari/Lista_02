import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  final TextEditingController numero1Controller = TextEditingController();
  final TextEditingController numero2Controller = TextEditingController();
  String resultado = '';

  double lerNumero1() {
    return double.tryParse(numero1Controller.text) ?? 0;
  }

  double lerNumero2() {
    return double.tryParse(numero2Controller.text) ?? 0;
  }

  void somar() {
    double numero1 = lerNumero1();
    double numero2 = lerNumero2();
    setState(() {
      resultado = 'Resultado: ${numero1 + numero2}';
    });
  }

  void subtrair() {
    double numero1 = lerNumero1();
    double numero2 = lerNumero2();
    setState(() {
      resultado = 'Resultado: ${numero1 - numero2}';
    });
  }

  void multiplicar() {
    double numero1 = lerNumero1();
    double numero2 = lerNumero2();
    setState(() {
      resultado = 'Resultado: ${numero1 * numero2}';
    });
  }

  void dividir() {
    double numero1 = lerNumero1();
    double numero2 = lerNumero2();
    setState(() {
      if (numero2 != 0) {
        resultado = 'Resultado: ${numero1 / numero2}';
      } else {
        resultado = 'Não é possível dividir por zero.';
      }
    });
  }

  void limpar() {
    numero1Controller.clear();
    numero2Controller.clear();
    setState(() {
      resultado = '';
    });
  }

  @override
  void dispose() {
    numero1Controller.dispose();
    numero2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: numero1Controller,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Primeiro número',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: numero2Controller,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Segundo número',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: somar, child: const Text('+')),
                ElevatedButton(onPressed: subtrair, child: const Text('-')),
                ElevatedButton(onPressed: multiplicar, child: const Text('×')),
                ElevatedButton(onPressed: dividir, child: const Text('÷')),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: limpar, child: const Text('Limpar')),
            const SizedBox(height: 30),
            Text(
              resultado,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
