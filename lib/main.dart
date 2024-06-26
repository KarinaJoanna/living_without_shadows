import 'package:flutter/material.dart';
import 'package:living_without_shadows/screens/chat_screen.dart';
import 'package:living_without_shadows/screens/profile_screen.dart';
import 'package:living_without_shadows/screens/chat.dart'; // Importa ChatPage
import 'screens/home_page.dart';

void main() {
  runApp(LivingWithoutShadowsApp());
}

class LivingWithoutShadowsApp extends StatelessWidget {
  const LivingWithoutShadowsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Living Without Shadows',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        '/home': (context) => HomePage(),
        ChatScreen.routeName: (context) => ChatScreen(),
        ChatPage.routeName: (context) =>
            ChatPage(), // Añade la ruta para ChatPage
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}
