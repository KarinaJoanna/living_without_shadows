import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LinkPreview extends StatelessWidget {
  final String url;

  LinkPreview(this.url);

  Future<Map<String, dynamic>> _fetchLinkPreview() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // Aquí podrías utilizar un paquete para extraer la información del enlace
      return json.decode(response.body);
    } else {
      throw Exception('Error fetching link preview');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetchLinkPreview(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final data = snapshot.data as Map<String, dynamic>;
          return GestureDetector(
            onTap: () => _launchURL(url),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (data['image'] != null) Image.network(data['image']),
                  if (data['title'] != null)
                    Text(
                      data['title'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  if (data['description'] != null)
                    Text(
                      data['description'],
                      style: TextStyle(fontSize: 14),
                    ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

void _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
