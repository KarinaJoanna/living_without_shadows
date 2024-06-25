import 'package:flutter/material.dart';
import 'package:living_without_shadows/screens/chat_screen.dart';
import 'package:living_without_shadows/screens/questionnaire_screen.dart';
import 'package:living_without_shadows/widgets/bottom_nav_bar.dart';
import '../widgets/header_section.dart';
import '../widgets/questionnaire_section.dart';
import '../widgets/talk_about_depression_section.dart';
import '../widgets/empowering_knowledge_section.dart';
import '../widgets/inspirational_quote_section.dart';
import '../widgets/chat_section.dart';
import '../widgets/footer_section.dart';

class HomePage extends StatelessWidget {
  final String userName = 'Profile1'; // Nombre del usuario

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _isSmallScreen(context)
          ? AppBar(
              title: Text(
                'Living Without Shadows',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 84, 26, 125),
                ),
              ),
            )
          : AppBar(
              title: Text(
                'Living Without Shadows',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 84, 26, 125),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {},
                  child: Text('About'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QuestionnaireScreen()),
                    );
                  },
                  child: Text('Questionnaire'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatScreen()),
                    );
                  },
                  child: Text('Let\'s Chat'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.orange,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
      drawer: _isSmallScreen(context) ? DrawerMenu() : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (!_isSmallScreen(context)) HeaderSection(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/profile.JPG'),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome back, $userName!',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'We have been waiting for you, take your time to explore and connect.',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
      bottomNavigationBar: BottomNavBar(),
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
