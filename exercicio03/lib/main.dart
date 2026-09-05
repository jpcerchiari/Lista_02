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
      home: TelaAntecessorSucessor(),
    );
  }
}

class TelaAntecessorSucessor extends StatefulWidget {
  const TelaAntecessorSucessor({super.key});

  @override
  State<TelaAntecessorSucessor> createState() => _TelaAntecessorSucessorState();
}

class _TelaAntecessorSucessorState extends State<TelaAntecessorSucessor> {
  final TextEditingController numeroController = TextEditingController();
  String resultado = '';

  void calcular() {
    int numero = int.tryParse(numeroController.text) ?? 0;

    setState(() {
      resultado =
          'Número: $numero\nAntecessor: ${numero - 1}\nSucessor: ${numero + 1}';
    });
  }

  void limpar() {
    numeroController.clear();
    setState(() {
      resultado = '';
    });
  }

  @override
  void dispose() {
    numeroController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Antecessor e Sucessor')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: numeroController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Número inteiro',
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
