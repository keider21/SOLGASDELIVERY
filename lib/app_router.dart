import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Importamos las pantallas desde /pages
import 'pages/home_page.dart';
import 'pages/auth_page.dart';

GoRouter buildRouter() {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const AuthPage(),
      ),
    ],
  );
}
