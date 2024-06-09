import 'package:flutter/material.dart';
import '../widgets/header_section.dart';
import '../widgets/questionnaire_section.dart';
import '../widgets/talk_about_depression_section.dart';
import '../widgets/empowering_knowledge_section.dart';
import '../widgets/inspirational_quote_section.dart';
import '../widgets/chat_section.dart';
import '../widgets/footer_section.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _isSmallScreen(context) ? DrawerMenu() : null,
      appBar: _isSmallScreen(context)
          ? AppBar(
              title: Text('Living Without Shadows'),
            )
          : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (!_isSmallScreen(context)) HeaderSection(),
            SizedBox(height: 10),
            QuestionnaireSection(),
            SizedBox(height: 10),
            TalkAboutDepressionSection(),
            SizedBox(height: 10),
            EmpoweringKnowledgeSection(),
            SizedBox(height: 10),
            InspirationalQuoteSection(),
            SizedBox(height: 10),
            ChatSection(),
            FooterSection(),
          ],
        ),
      ),
    );
  }

  bool _isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }
}

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 236, 168, 166),
            ),
            child: Text(
              'Living Without Shadows',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text('Questionnaire'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Information'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text('Let\'s Chat'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
