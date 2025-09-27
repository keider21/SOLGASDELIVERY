import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'product_page.dart';
import 'order_page.dart';
import 'order_history_page.dart';
import 'profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido ${user?.email ?? ''}'),
        actions: [
          IconButton(
            onPressed: () => FirebaseAuth.instance.signOut(),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Productos"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ProductPage())),
          ),
          ListTile(
            title: const Text("Nuevo Pedido"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const OrderPage())),
          ),
          ListTile(
            title: const Text("Historial de Pedidos"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const OrderHistoryPage())),
          ),
          ListTile(
            title: const Text("Perfil"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfilePage())),
          ),
        ],
      ),
    );
  }
}
