import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
      child: Column(
        children: [
          Text(
            'Welcome to Living Without Shadows',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            'We are glad to have you here. Living Without Shadows is a safe and welcoming place where you can find support, information, and resources to those dealing with depression.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
