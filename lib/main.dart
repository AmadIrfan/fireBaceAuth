import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:modelsheet/aut.dart';

import './reset_page.dart';
import './TabBar_Screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const AuthScreen(),
      routes: {
        TabBarScreen.routeName: (context) => const TabBarScreen(),
        ResetPasword.routName: (context) => const ResetPasword(),
      },
    );
  }
}
