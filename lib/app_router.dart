import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'pages/auth_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/auth',
  routes: [
    GoRoute(
      path: '/auth',
      builder: (context, state) => const AuthPage(),
    ),
  ],
);
