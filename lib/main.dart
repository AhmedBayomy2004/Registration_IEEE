import 'package:flutter/material.dart';
import 'package:registration_ieee/views/layout.dart';

void main() {
  runApp(const RegistrationApp());
}

class RegistrationApp extends StatelessWidget {
  const RegistrationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Layout(),
    );
  }
}
