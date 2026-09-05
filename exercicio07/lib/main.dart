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
      home: TelaReajuste(),
    );
  }
}

class TelaReajuste extends StatefulWidget {
  const TelaReajuste({super.key});

  @override
  State<TelaReajuste> createState() => _TelaReajusteState();
}

class _TelaReajusteState extends State<TelaReajuste> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController salarioController = TextEditingController();
  final TextEditingController percentualController = TextEditingController();
  String resultado = '';

  void calcular() {
    String nome = nomeController.text;
    double salario = double.tryParse(salarioController.text) ?? 0;
    double percentual = double.tryParse(percentualController.text) ?? 0;
    double aumento = salario * percentual / 100;
    double novoSalario = salario + aumento;

    setState(() {
      resultado =
          'Funcionário: $nome\nSalário atual: R\$ ${salario.toStringAsFixed(2)}\nAumento: R\$ ${aumento.toStringAsFixed(2)}\nNovo salário: R\$ ${novoSalario.toStringAsFixed(2)}';
    });
  }

  void limpar() {
    nomeController.clear();
    salarioController.clear();
    percentualController.clear();
    setState(() {
      resultado = '';
    });
  }

  @override
  void dispose() {
    nomeController.dispose();
    salarioController.dispose();
    percentualController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reajuste Salarial')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome do funcionário',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: salarioController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Salário atual',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: percentualController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Percentual de reajuste',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: calcular,
                  child: const Text('Calcular'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(onPressed: limpar, child: const Text('Limpar')),
              ],
            ),
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
