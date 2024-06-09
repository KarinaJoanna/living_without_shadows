import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(LivingWithoutShadowsApp());
}

class LivingWithoutShadowsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Living Without Shadows',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
