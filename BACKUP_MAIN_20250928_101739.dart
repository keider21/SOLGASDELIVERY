import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'app_router.dart';
import 'theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const SolgasApp());
}

class SolgasApp extends StatelessWidget {
  const SolgasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'SOLGAS DELIVERY',
      theme: buildSolgasTheme(),
      routerConfig: buildRouter(),
      debugShowCheckedModeBanner: false,
    );
  }
}
