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
      home: TelaEstoque(),
    );
  }
}

class TelaEstoque extends StatefulWidget {
  const TelaEstoque({super.key});

  @override
  State<TelaEstoque> createState() => _TelaEstoqueState();
}

class _TelaEstoqueState extends State<TelaEstoque> {
  final TextEditingController quantidadeController = TextEditingController();
  int estoque = 0;
  String mensagem = '';

  void registrarEntrada() {
    int quantidade = int.tryParse(quantidadeController.text) ?? 0;

    setState(() {
      if (quantidade > 0) {
        estoque = estoque + quantidade;
        mensagem = 'Entrada realizada com sucesso.';
      } else {
        mensagem = 'Informe uma quantidade válida.';
      }
    });
  }

  void registrarSaida() {
    int quantidade = int.tryParse(quantidadeController.text) ?? 0;

    setState(() {
      if (quantidade <= 0) {
        mensagem = 'Informe uma quantidade válida.';
      } else if (quantidade <= estoque) {
        estoque = estoque - quantidade;
        mensagem = 'Saída realizada com sucesso.';
      } else {
        mensagem = 'Quantidade maior que o estoque disponível.';
      }
    });
  }

  void limparCampo() {
    quantidadeController.clear();
    setState(() {
      mensagem = '';
    });
  }

  @override
  void dispose() {
    quantidadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Controle de Estoque')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Quantidade atual em estoque: $estoque',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: quantidadeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Quantidade',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: registrarEntrada,
                  child: const Text('Entrada'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: registrarSaida,
                  child: const Text('Saída'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: limparCampo,
                  child: const Text('Limpar campo'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              mensagem,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
