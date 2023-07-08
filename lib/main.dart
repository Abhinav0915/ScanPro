import 'package:flutter/material.dart';
import 'package:scanpro/routes.dart';
import 'package:scanpro/screens/inventory.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const InventoryPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
