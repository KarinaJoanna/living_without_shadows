import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, String>> _messages = [];
  final TextEditingController _controller = TextEditingController();
  String _apiKey = ""; // API Key de OpenAI

  Future<String> _fetchResponse(String prompt) async {
    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/completions'),
      headers: {
        'Authorization': 'Bearer $_apiKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'model': 'gpt-3.5-turbo',
        'prompt': prompt,
        'max_tokens': 200,
        'temperature': 0,
        'top_p': 1,
        'n': 1,
        'stream': false,
        'logprobs': null,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['choices'][0]['text'].trim();
    } else if (response.statusCode == 404) {
      print("Error 404: Recurso no encontrado.");
      print("Mensaje de error: ${response.body}");
      throw Exception('Recurso no encontrado');
    } else {
      print("Error en la solicitud: ${response.statusCode}");
      print("Mensaje de error: ${response.body}");
      throw Exception('Error en la solicitud: ${response.statusCode}');
    }
  }

  void _sendMessage(String message) async {
    setState(() {
      _messages.add({'sender': 'user', 'message': message});
    });

    try {
      final botResponse = await _fetchResponse(message);
      setState(() {
        _messages.add({'sender': 'bot', 'message': botResponse});
      });
    } catch (e) {
      setState(() {
        _messages.add({'sender': 'bot', 'message': 'Error: $e'});
      });
    }

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatbot Name'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ListTile(
                  title: Align(
                    alignment: message['sender'] == 'user'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: message['sender'] == 'user'
                            ? Colors.blue
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        message['message']!,
                        style: TextStyle(
                          color: message['sender'] == 'user'
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Escribe tu mensaje...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      _sendMessage(_controller.text);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
