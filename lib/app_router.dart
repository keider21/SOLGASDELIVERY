import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'pages/auth_page.dart';
import 'pages/home_page.dart';
import 'widgets/auth_gate.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    // AuthGate decide si ir a /auth o /home
    GoRoute(
      path: '/',
      builder: (context, state) => const AuthGate(),
    ),
    GoRoute(
      path: '/auth',
      builder: (context, state) => const AuthPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
  ],
);
