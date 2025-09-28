import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SOLGAS DELIVERY"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "Menú",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: const Text("Productos"),
              onTap: () => context.go('/products'),
            ),
            ListTile(
              title: const Text("Nuevo Pedido"),
              onTap: () => context.go('/order'),
            ),
            ListTile(
              title: const Text("Historial de Pedidos"),
              onTap: () => context.go('/orders'),
            ),
            ListTile(
              title: const Text("Perfil"),
              onTap: () => context.go('/profile'),
            ),
            ListTile(
              title: const Text("Panel de Admin"),
              onTap: () => context.go('/admin'),
            ),
            ListTile(
              title: const Text("Cerrar Sesión"),
              onTap: () => context.go('/auth'),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          "Bienvenido a SOLGAS DELIVERY",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
