import 'package:flutter/material.dart';
import 'package:living_without_shadows/screens/chat_screen.dart';
import 'package:living_without_shadows/widgets/bottom_nav_bar.dart';
//import 'package:living_without_shadows/screens/home_page.dart';
//import 'package:living_without_shadows/screens/talk_about_depression_screen.dart';
import '../widgets/footer_section.dart';
import 'questionnaire_screen_main.dart';

class QuestionnaireScreen extends StatelessWidget {
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
        child: Center(
          child: Column(
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
                        'Questionnaire',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 82, 43, 121),
                        ),
                      ),
                      SizedBox(height: 10),
                      Image.asset('assets/qsection.png', height: 300),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Privacy Matters to Us',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'We want you to know that Living Without Shadows is a safe and secure space for you. Our questionnaire is designed to help us better understand your needs and provide you with the best support possible',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'You can take our questionnaire with complete confidence, knowing that your privacy is our top priority. We are committed to protecting your personal information and ensuring that it remains confidential.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Thank you for trusting us. Your journey towards mental well-being is important, and we are here to support you every step of the way.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              Card(
                margin: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: Color.fromARGB(255, 155, 203, 243),
                child: Container(
                  width: _getCardWidth(context),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '“Mental well-being is not a destination, but a process. It’s about how you drive, not where you’re going.”',
                        style: TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 10),
                      Text(
                        '- Noam Shpancer, PhD',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Take our hand and let\'s go through this together',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'With each step we take, know that you\'re not alone. We\'re here to walk beside you, guiding you towards understanding and well-being.\n\nYour trust is a gift, and your willingness to share your journey with us is deeply appreciated.\n\nBy completing the questionnaire, you\'re granting us the opportunity to journey together, hand in hand, towards a future filled with hope and growth.\n\nBut before we do that read the following guidelines:',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 10),
                    Text(
                      '1. Make sure to answer with complete honesty; we will not judge you, we are here to help you.\n\n2. Provide as much detail as possible in your responses. This helps us understand your situation better.\n\n3. Try to be clear and concise in your answers. Ambiguous responses may lead to misunderstandings and hinder our ability to assist you effectively.\n\n4. Don\'t hesitate to express how you\'re truly feeling. Your emotions are valid, and acknowledging them helps us provide the support you need.\n\n5. There\'s no rush. Take your time to think about your responses and provide thoughtful answers. Your well-being is our priority, and we\'re here to support you at your own pace.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuestionnaireMain(),
                            ),
                          );
                        },
                        child: Text('Start'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color.fromARGB(255, 112, 0, 193),
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              FooterSection(),
            ],
          ),
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
