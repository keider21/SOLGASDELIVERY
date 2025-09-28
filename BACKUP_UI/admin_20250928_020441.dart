import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    final stream = FirebaseFirestore.instance
        .collection("orders")
        .orderBy("createdAt", descending: true)
        .snapshots();

    return Scaffold(
      appBar: AppBar(title: const Text("Panel de Administración")),
      body: StreamBuilder<QuerySnapshot>(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No hay pedidos aún"));
          }

          final docs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, i) {
              final data = docs[i].data() as Map<String, dynamic>;
              final product = data["productName"] ?? "Producto desconocido";
              final price = (data["price"] ?? 0).toDouble();
              final status = data["status"] ?? "pendiente";
              final userId = data["userId"] ?? "desconocido";

              String when = "";
              if (data["createdAt"] != null && data["createdAt"] is Timestamp) {
                when = (data["createdAt"] as Timestamp).toDate().toString();
              }

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text(product),
                  subtitle: Text("S/ ${price.toStringAsFixed(2)} - Cliente: $userId\n$when"),
                  trailing: DropdownButton<String>(
                    value: status,
                    items: const [
                      DropdownMenuItem(value: "pendiente", child: Text("Pendiente")),
                      DropdownMenuItem(value: "en camino", child: Text("En camino")),
                      DropdownMenuItem(value: "entregado", child: Text("Entregado")),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        FirebaseFirestore.instance
                            .collection("orders")
                            .doc(docs[i].id)
                            .update({"status": value});
                      }
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
