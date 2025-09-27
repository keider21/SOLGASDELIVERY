import 'package:flutter/material.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Historial de Pedidos')),
      body: const Center(child: Text('Aquí se mostrarán pedidos anteriores')),
    );
  }
}
