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
      home: TelaConsumo(),
    );
  }
}

class TelaConsumo extends StatefulWidget {
  const TelaConsumo({super.key});

  @override
  State<TelaConsumo> createState() => _TelaConsumoState();
}

class _TelaConsumoState extends State<TelaConsumo> {
  final TextEditingController distanciaController = TextEditingController();
  final TextEditingController combustivelController = TextEditingController();
  String resultado = '';

  void calcular() {
    double distancia = double.tryParse(distanciaController.text) ?? 0;
    double litros = double.tryParse(combustivelController.text) ?? 0;

    setState(() {
      if (litros > 0) {
        double consumo = distancia / litros;
        String classificacao;

        if (consumo >= 12) {
          classificacao = 'Econômico';
        } else {
          classificacao = 'Consumo elevado';
        }

        resultado =
            'Consumo médio: ${consumo.toStringAsFixed(1)} km/l\nClassificação: $classificacao';
      } else {
        resultado = 'A quantidade de combustível deve ser maior que zero.';
      }
    });
  }

  void limpar() {
    distanciaController.clear();
    combustivelController.clear();
    setState(() {
      resultado = '';
    });
  }

  @override
  void dispose() {
    distanciaController.dispose();
    combustivelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Consumo de Combustível')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: distanciaController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Distância em quilômetros',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: combustivelController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Combustível em litros',
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
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
