import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // User logged in → go to home
        if (snapshot.hasData) {
          Future.microtask(() => context.go('/home'));
          return const SizedBox.shrink();
        }

        // No user → go to auth
        Future.microtask(() => context.go('/auth'));
        return const SizedBox.shrink();
      },
    );
  }
}
