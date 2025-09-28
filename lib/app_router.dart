import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Importar páginas
import 'pages/auth_page.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import 'pages/order_page.dart';
import 'pages/order_history_page.dart';
import 'pages/product_page.dart';
import 'widgets/admin_page.dart';

/// Configuración de rutas con GoRouter
GoRouter buildRouter() {
  return GoRouter(
    initialLocation: '/auth', // 👉 Cambia a /home si quieres entrar directo
    routes: [
      GoRoute(
        path: '/auth',
        builder: (context, state) => const AuthPage(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        path: '/order',
        builder: (context, state) => const OrderPage(),
      ),
      GoRoute(
        path: '/orders',
        builder: (context, state) => const OrderHistoryPage(),
      ),
      GoRoute(
        path: '/products',
        builder: (context, state) => const ProductPage(),
      ),
      GoRoute(
        path: '/admin',
        builder: (context, state) => const AdminPage(),
      ),
    ],
  );
}
