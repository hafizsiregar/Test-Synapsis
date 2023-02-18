import 'package:flutter/material.dart';
import 'package:test_synapsis/pages/auth_page.dart';
import 'package:test_synapsis/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      routes: {
        '/home': (context) => const HomePage(),
      },
    );
  }
}
