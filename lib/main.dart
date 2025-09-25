import 'package:flutter/material.dart';

void main() {
  runApp(SolgasApp());
}

class SolgasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SOLGAS DELIVERY',
      theme: ThemeData(
        primaryColor: Color(0xFF003366),
        scaffoldBackgroundColor: Colors.grey[100],
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color(0xFF003366),
          secondary: Color(0xFFFF6600),
        ),
      ),
      home: ProductListPage(),
    );
  }
}

class Product {
  final String name;
  final String description;
  final double price;
  final String image;

  Product(this.name, this.description, this.price, this.image);
}

class ProductListPage extends StatelessWidget {
  final List<Product> products = [
    Product("Balón de Gas Premium 10kg",
        "Gas de alta pureza, mejor rendimiento", 65.0, "assets/images/10kg.png"),
    Product("Balón de Gas Premium 45kg",
        "Gas de alta pureza, mejor rendimiento", 270.0, "assets/images/45kg.png"),
    Product("Balón de Gas Normal 10kg",
        "Uso doméstico y económico", 65.0, "assets/images/10kg.png"),
    Product("Balón de Gas Normal 45kg",
        "Uso industrial y doméstico prolongado", 270.0, "assets/images/45kg.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF003366), Color(0xFF005599)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Row(
              children: [
                Image.asset("assets/images/logo.png", height: 40),
                SizedBox(width: 12),
                Text(
                  "SOLGAS DELIVERY",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(15),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  elevation: 8,
                  shadowColor: Colors.black26,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 12),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(product.image,
                              height: 80, width: 80, fit: BoxFit.cover),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(product.name,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF003366))),
                              SizedBox(height: 5),
                              Text(product.description,
                                  style: TextStyle(color: Colors.grey[700])),
                              SizedBox(height: 10),
                              Text("S/ ${product.price.toStringAsFixed(2)}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green[700])),
                            ],
                          ),
                        ),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFF6600),
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 12),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: Color(0xFF003366),
                                content: Text(
                                    "Pedido confirmado: ${product.name}",
                                    style: TextStyle(color: Colors.white))));
                          },
                          icon: Icon(Icons.shopping_cart, color: Colors.white),
                          label: Text("Pedir",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
