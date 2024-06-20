import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      color: Colors.grey[200],
      child: const Column(
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
