import 'package:flutter/material.dart';
import 'package:living_without_shadows/widgets/gradient_text.dart';
import 'package:living_without_shadows/screens/chat.dart';
import 'package:living_without_shadows/widgets/bottom_nav_bar.dart'; // Asegúrate de importar el widget de la barra de navegación inferior

class ChatScreen extends StatelessWidget {
  static const routeName = '/chat';
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Soothen",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromRGBO(244, 239, 248, 1.0),
                          Color.fromRGBO(244, 239, 248, 1.0),
                        ]),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Hi, I'm Soothen, I'm happy to have you here",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 58, 58, 58),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "I am here to assist you with any queries you might have. Feel free to ask me anything and I'll do my best to help.",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color.fromARGB(255, 58, 58, 58),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Image.asset(
                          'assets/soothen.png',
                          height: 150,
                          width: 150,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 16.0, left: 16.0, right: 16.0, bottom: 16.0),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, ChatPage.routeName);
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: GradientText(
                              "Let's Chat",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(67, 67, 68, 1),
                                  Color.fromRGBO(67, 67, 68, 1),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          BottomNavBar(), // Añadir la barra de navegación inferior
    );
  }
}
