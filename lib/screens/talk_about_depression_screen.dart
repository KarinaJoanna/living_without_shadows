import 'package:flutter/material.dart';
import 'package:living_without_shadows/widgets/header_section.dart';
import '../widgets/footer_section.dart';
import '../widgets/header_widget.dart';

class TalkAboutDepressionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _isSmallScreen(context)
          ? AppBar(
              title: Text('Talking About Depression'),
            )
          : AppBar(
              title: Text('Talking About Depression'),
              actions: [
                TextButton(
                  onPressed: () {},
                  child: Text('About'),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Questionnaire'),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Information'),
                ),
                ElevatedButton(
                  onPressed: () {},
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
            HeaderWidget(
              title: 'Talking About Depression',
              subtitle: 'Living without shadows',
            ),
            SizedBox(height: 10),
            if (!_isSmallScreen(context)) HeaderSection(),
            SizedBox(height: 10),
            _buildInfoCard(
              context,
              title: '5 Ways To Find Joy When You Are Depressed',
              description:
                  'When you´re in a depressive episode, it can feel as if depression has sucked the joy out of everything. So, in this blog post, we share 5 things you can do to find some of that missing joy when you feel depressed.',
              imagePath: 'assets/joy_depression.jpg',
            ),
            SizedBox(height: 10),
            _buildInfoCard(
              context,
              title: 'What Depression Looks Like In A Friendship',
              description:
                  'In this blog post, we explain some of the most common ways that depression can affect people´s friendships',
              imagePath: 'assets/depression_friendship.jpg',
            ),
            SizedBox(height: 10),
            _buildInfoCard(
              context,
              title: 'How To Survive A Depressive Episode',
              description:
                  'In this blog post, we´ll explain exactly what you need to do to survive a depressive episode.',
              imagePath: 'assets/depressive_episode.jpg',
            ),
            SizedBox(height: 10),
            _buildInfoCard(
              context,
              title: 'Depression’s Vicious Cycle & The 5 Factors That Fuel It',
              description:
                  'In this blog post, you’ll learn about depression’s vicious cycle, the five factors that fuel it, and what you need to do in order to break out of it.',
              imagePath: 'assets/mental_health_education.jpg',
            ),
            SizedBox(height: 10),
            FooterSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context,
      {required String title,
      required String description,
      required String imagePath}) {
    return Card(
      margin: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        width: _getCardWidth(context),
        padding: EdgeInsets.all(20),
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
            Image.asset(imagePath),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.left,
            ),
          ],
        ),
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
