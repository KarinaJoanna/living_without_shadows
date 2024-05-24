import 'package:flutter/material.dart';

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

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Living Without Shadows'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderSection(),
            QuestionnaireSection(),
            TalkAboutDepressionSection(),
            EmpoweringKnowledgeSection(),
            InspirationalQuoteSection(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
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

class QuestionnaireSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Take our questionnaire',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Take our questionnaire to gain a better understanding of your mental health and we will provide resources tailored to your needs.',
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Navigate to questionnaire page
            },
            child: Text('Questionnaire'),
          ),
        ],
      ),
    );
  }
}

class TalkAboutDepressionSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Let\'s Talk About Depression',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Image.asset('assets/talk1.png'),
                    SizedBox(height: 5),
                    Text('I get it now, depression isn\'t being sad...'),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    Image.asset('assets/talk2.png'),
                    SizedBox(height: 5),
                    Text(
                        'Breaking The Silence: Why Talking About Depression Matters'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class EmpoweringKnowledgeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Empowering Through Knowledge',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Image.asset('assets/knowledge1.png'),
                    SizedBox(height: 5),
                    Text(
                        'Understanding Depression: Empowering Through Knowledge To Fulfill Our Mission'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class InspirationalQuoteSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
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

class FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.blue[50],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'We are here to offer you support, information, and resources to assist you on your journey towards mental well-being. Explore the tools you need to manage stress, support self-care activities, and live your best life free of shadows. You are not alone in this; we\'re here to help you find light in the darkness.',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Navigate to chat page
              },
              child: Text('Let\'s Chat'),
            ),
          ),
        ],
      ),
    );
  }
}
