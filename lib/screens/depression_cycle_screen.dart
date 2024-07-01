import 'package:flutter/material.dart';
import 'package:living_without_shadows/screens/chat_screen.dart';
import 'package:living_without_shadows/screens/home_page.dart';
import 'package:living_without_shadows/screens/profile_screen.dart';
import 'package:living_without_shadows/screens/questionnaire_screen.dart';
import 'package:living_without_shadows/widgets/bottom_nav_bar.dart';
import 'package:living_without_shadows/widgets/header_section.dart';
import '../widgets/footer_section.dart';

class DepressionCycleScreen extends StatelessWidget {
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
                      'Depression´s Vicious Cycle & The 5 Factors That Fuel It',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 82, 43, 121),
                      ),
                    ),
                    SizedBox(height: 10),
                    Image.asset('assets/mental_health_education.png',
                        height: 150),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            if (!_isSmallScreen(context)) HeaderSection(),
            SizedBox(height: 10),
            _buildContentMethod(
              title:
                  "Method #1: Making A List Of Your \"Little Accomplishments\"",
              content:
                  "When you're in a depressive episode, it's extremely common to feel tired, unmotivated and overwhelmed by even the \"little things\". For this reason, making a list of all these \"little accomplishments\" and congratulating yourself for them can give your mood a notable boost.",
            ),
            _buildContentMethod(
              title:
                  "Method #2: Be Mindful Of And Grateful For Anything That's Making Your Depressive Episode More Bearable",
              content:
                  "Practicing gratitude can contribute to feeling more joyful. It can help to bring awareness to anything that's making your depressive episode a little bit more bearable than it would otherwise be.",
            ),
            _buildContentMethod(
              title:
                  "Method #3: Giving Yourself Permission To Do Something Solely For You",
              content:
                  "It's important to take time out for yourself when you’re in a depressive episode, and to do things that are solely for your own enjoyment, comfort and peace of mind.",
            ),
            _buildContentMethod(
              title:
                  "Method #4: Replacing \"I Have To Do This\" With \"I Want To Do This\"",
              content:
                  "A shift in mindset can help bring about relief from the everyday difficulties of being in a depressive episode. Replacing the thought “I have to do this” with “I want to do this\" can add meaning and purpose to various tasks and responsibilities.",
            ),
            _buildContentMethod(
              title:
                  "Method #5: Adding A \"Joy Addition\" To Your Everyday Tasks, Routines And Activities",
              content:
                  "Finding joy in your day-to-day routine can be challenging, especially when you’re in a depressive episode. To make it easier, ask yourself how you can add more joy to each of your daily tasks, routines and activities.",
            ),
            SizedBox(height: 10),
            FooterSection(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget _buildContentMethod({required String title, required String content}) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 10),
          Text(
            content,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.left,
          ),
        ],
      ),
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
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.orange,
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
            title: Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          ListTile(
            title: Text('Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Questionnaire'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuestionnaireScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Chat'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
