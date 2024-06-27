import 'package:flutter/material.dart';
import 'package:living_without_shadows/screens/chat_screen.dart';
import 'package:living_without_shadows/screens/depression_cycle_screen.dart';
import 'package:living_without_shadows/screens/depression_friendship_screen.dart';
import 'package:living_without_shadows/screens/depressive_episode_screen.dart';
import 'package:living_without_shadows/screens/home_page.dart';
import 'package:living_without_shadows/screens/profile_screen.dart';
import 'package:living_without_shadows/screens/questionnaire_screen.dart';
import 'package:living_without_shadows/screens/ways_to_find_joy_screen.dart';
import 'package:living_without_shadows/widgets/bottom_nav_bar.dart';
import 'package:living_without_shadows/widgets/header_section.dart';
import 'package:living_without_shadows/widgets/footer_section.dart';

class TalkAboutDepressionScreen extends StatelessWidget {
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
                      'Talking About Depression',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 82, 43, 121),
                      ),
                    ),
                    SizedBox(height: 10),
                    Image.asset('assets/t_about_d.png', height: 150),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Here you can find some articles that can help you understand depression better and how to deal with it in different situations. Talking about depression is important, and together, we will try to stop viewing it as a taboo.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height:
                      1.5, // Increase the line height for better readability
                ),
              ),
            ),
            SizedBox(height: 20),
            if (!_isSmallScreen(context)) HeaderSection(),
            SizedBox(height: 10),
            _buildInfoCard(
              context,
              title: '5 Ways To Find Joy When You Are Depressed',
              description:
                  'When you’re in a depressive episode, it can feel as if depression has sucked the joy out of everything. So, in this blog post, we share 5 things you can do to find some of that missing joy when you feel depressed.',
              imagePath: 'assets/joy_depression.png',
              imageHeight: 200,
              imageWidth: double.infinity,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FindJoyScreen()),
                );
              },
            ),
            SizedBox(height: 10),
            _buildInfoCard(
              context,
              title: 'What Depression Looks Like In A Friendship',
              description:
                  'In this blog post, we explain some of the most common ways that depression can affect people’s friendships.',
              imagePath: 'assets/depression_friendship.png',
              imageHeight: 200,
              imageWidth: double.infinity,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DepressionInFriendshipScreen()),
                );
              },
            ),
            SizedBox(height: 10),
            _buildInfoCard(
              context,
              title: 'How To Survive A Depressive Episode',
              description:
                  'In this blog post, we’ll explain exactly what you need to do to survive a depressive episode.',
              imagePath: 'assets/depressive_episode.png',
              imageHeight: 200,
              imageWidth: double.infinity,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DepressionEpisodeScreen()),
                );
              },
            ),
            SizedBox(height: 10),
            _buildInfoCard(
              context,
              title: 'Depression’s Vicious Cycle & The 5 Factors That Fuel It',
              description:
                  'In this blog post, you’ll learn about depression’s vicious cycle, the five factors that fuel it, and what you need to do in order to break out of it.',
              imagePath: 'assets/mental_health_education.png',
              imageHeight: 200,
              imageWidth: double.infinity,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DepressionCycleScreen()),
                );
              },
            ),
            SizedBox(height: 10),
            FooterSection(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget _buildInfoCard(BuildContext context,
      {required String title,
      required String description,
      required String imagePath,
      required double imageHeight,
      required double imageWidth,
      required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Card(
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
              Image.asset(
                imagePath,
                height: imageHeight,
                width: imageWidth,
                fit: BoxFit
                    .cover, // Adjust the image to cover the given width and height
              ),
              SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.left,
              ),
            ],
          ),
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
