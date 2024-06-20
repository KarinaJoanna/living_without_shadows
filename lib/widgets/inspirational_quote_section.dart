import 'package:flutter/material.dart';

class InspirationalQuoteSection extends StatelessWidget {
  const InspirationalQuoteSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: const Column(
        children: [
          Text(
            'No matter how dark the night may seem, there is always a light in the darkness.',
            style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
