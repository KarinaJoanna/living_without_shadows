import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      color: Colors.grey[200],
      child: Column(
        children: [
          Text(
            '© 2024 Living Without Shadows. All rights reserved.',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5),
          Text(
            'Contact us: info@livingwithoutshadows.org',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
