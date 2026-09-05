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
      home: TelaVendas(),
    );
  }
}

class TelaVendas extends StatefulWidget {
  const TelaVendas({super.key});

  @override
  State<TelaVendas> createState() => _TelaVendasState();
}

class _TelaVendasState extends State<TelaVendas> {
  final TextEditingController produtoController = TextEditingController();
  final TextEditingController precoController = TextEditingController();
  final TextEditingController quantidadeController = TextEditingController();
  String resultado = '';

  void calcular() {
    String produto = produtoController.text;
    double preco = double.tryParse(precoController.text) ?? 0;
    int quantidade = int.tryParse(quantidadeController.text) ?? 0;
    double subtotal = preco * quantidade;
    double desconto;

    if (subtotal > 500) {
      desconto = subtotal * 0.10;
    } else {
      desconto = 0;
    }

    double total = subtotal - desconto;

    setState(() {
      resultado =
          'Produto: $produto\nQuantidade: $quantidade\nSubtotal: R\$ ${subtotal.toStringAsFixed(2)}\nDesconto: R\$ ${desconto.toStringAsFixed(2)}\nTotal: R\$ ${total.toStringAsFixed(2)}';
    });
  }

  void limpar() {
    produtoController.clear();
    precoController.clear();
    quantidadeController.clear();
    setState(() {
      resultado = '';
    });
  }

  @override
  void dispose() {
    produtoController.dispose();
    precoController.dispose();
    quantidadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sistema de Vendas')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: produtoController,
              decoration: const InputDecoration(
                labelText: 'Produto',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: precoController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Preço unitário',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
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
