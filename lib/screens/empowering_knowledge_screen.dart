import 'package:flutter/material.dart';
import 'package:living_without_shadows/screens/chat_screen.dart';
import 'package:living_without_shadows/screens/home_page.dart';
import 'package:living_without_shadows/screens/profile_screen.dart';
import 'package:living_without_shadows/screens/questionnaire_screen.dart';
import 'package:living_without_shadows/widgets/bottom_nav_bar.dart';
import 'package:living_without_shadows/widgets/header_section.dart';
import 'package:living_without_shadows/widgets/footer_section.dart';
import 'package:living_without_shadows/widgets/youtube_video.dart';

class EmpoweringKnowledgeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _isSmallScreen(context)
          ? AppBar(
              title: Text('Living Without Shadows'),
            )
          : AppBar(
              title: Text('Living Without Shadows'),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!_isSmallScreen(context)) HeaderSection(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    margin: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      width: _getCardWidth(context),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            'Empowering Through Knowledge',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 82, 43, 121),
                            ),
                          ),
                          SizedBox(height: 10),
                          Image.asset('assets/empowering.png', height: 150),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildInfoCard(
                    context,
                    title: 'What is Depression?',
                    description:
                        'Depression is a common and serious medical illness that negatively affects how you feel, the way you think, and how you act. Fortunately, it is also treatable.',
                    moreInfo:
                        'Depression is a mood disorder that causes a persistent feeling of sadness and loss of interest. It affects how you feel, think, and behave and can lead to a variety of emotional and physical problems. You may have trouble doing normal day-to-day activities, and sometimes you may feel as if life isn\'t worth living.',
                  ),
                  SizedBox(height: 20),
                  _buildInfoCard(
                    context,
                    title: 'Symptoms of Depression',
                    description:
                        'Common symptoms include persistent sadness, loss of interest in activities once enjoyed, changes in appetite, trouble sleeping or sleeping too much, loss of energy, and feelings of worthlessness.',
                    moreInfo:
                        'Symptoms of depression can vary, but they commonly include feeling sad or having a depressed mood, loss of interest or pleasure in activities once enjoyed, changes in appetite — weight loss or gain unrelated to dieting, trouble sleeping or sleeping too much, loss of energy or increased fatigue, and feelings of worthlessness or guilt.',
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Watch This Video to Learn More',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  YoutubeVideo('_5OkC09xP34'),
                  SizedBox(height: 20),
                  Text(
                    'Frequently Asked Questions (FAQs)',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildFaqCard(
                    context,
                    question: 'What causes depression?',
                    answer:
                        'Depression can result from a combination of genetic, biological, environmental, and psychological factors.',
                  ),
                  SizedBox(height: 10),
                  _buildFaqCard(
                    context,
                    question: 'How is depression treated?',
                    answer:
                        'Depression is treatable through medications, psychotherapy, or a combination of both. It\'s important to consult a healthcare provider for a proper diagnosis and treatment plan.',
                  ),
                ],
              ),
            ),
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

  double _getCardWidth(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return screenWidth * 0.9;
    } else if (screenWidth < 1200) {
      return screenWidth * 0.75;
    } else {
      return screenWidth * 0.5;
    }
  }

  Widget _buildInfoCard(BuildContext context,
      {required String title,
      required String description,
      required String moreInfo}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(title),
                      content: Text(moreInfo),
                      actions: [
                        TextButton(
                          child: Text('Close'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Learn More'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFaqCard(BuildContext context,
      {required String question, required String answer}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              answer,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text('Questionnaire'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuestionnaireScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text('Let\'s Chat'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
