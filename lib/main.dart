import 'package:flutter/material.dart';
import 'package:teste/primeira.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Navegação',
      home: Inicio(), 
    );
  }
}

