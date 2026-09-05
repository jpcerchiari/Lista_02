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
      home: TelaMaioridade(),
    );
  }
}

class TelaMaioridade extends StatefulWidget {
  const TelaMaioridade({super.key});

  @override
  State<TelaMaioridade> createState() => _TelaMaioridadeState();
}

class _TelaMaioridadeState extends State<TelaMaioridade> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController idadeController = TextEditingController();
  String resultado = '';

  void verificar() {
    String nome = nomeController.text;
    int idade = int.tryParse(idadeController.text) ?? 0;

    setState(() {
      if (idade >= 18) {
        resultado = '$nome é maior de idade.';
      } else {
        resultado = '$nome é menor de idade.';
      }
    });
  }

  void limpar() {
    nomeController.clear();
    idadeController.clear();
    setState(() {
      resultado = '';
    });
  }

  @override
  void dispose() {
    nomeController.dispose();
    idadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verificador de Idade')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: idadeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Idade',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: verificar,
                  child: const Text('Verificar'),
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
