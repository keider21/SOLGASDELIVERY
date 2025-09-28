import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'main_page.dart'; // Asegúrate que existe y es tu página principal

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    try {
      // ✅ Intentar login
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // ✅ Si login es exitoso, navegar al MainPage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainPage()),
      );
    } on FirebaseAuthException catch (e) {
      // ❌ Mostrar error en pantalla
      String errorMsg = "Error desconocido";
      if (e.code == 'user-not-found') {
        errorMsg = "Usuario no encontrado";
      } else if (e.code == 'wrong-password') {
        errorMsg = "Contraseña incorrecta";
      } else {
        errorMsg = e.message ?? "Error de autenticación";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMsg)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Correo"),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: "Contraseña"),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: login,
              child: const Text("Entrar"),
            ),
            TextButton(
              onPressed: () {
                // Aquí luego se conecta el registro
              },
              child: const Text("¿No tienes cuenta? Regístrate"),
            )
          ],
        ),
      ),
    );
  }
}
