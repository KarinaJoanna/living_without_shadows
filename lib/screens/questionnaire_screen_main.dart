import 'package:flutter/material.dart';
import 'package:living_without_shadows/screens/chat_screen.dart';
import 'package:living_without_shadows/screens/questionnaire_screen.dart';
import '../widgets/footer_section.dart';

class QuestionnaireMain extends StatelessWidget {
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
                color: Colors.white,
                child: Container(
                  width: _getCardWidth(context),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Let’s Begin',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'With each step we take, know that you\'re not alone. We\'re here to walk beside you, guiding you towards understanding and well-being.',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 20),
                      _buildSectionTitle('About you'),
                      _buildTextField('How Can I Help You?'),
                      _buildTextField('How Can I Help You?'),
                      _buildTextField('How Can I Help You?'),
                      SizedBox(height: 20),
                      _buildSectionTitle('About your future'),
                      _buildTextField('How Can I Help You?'),
                      _buildTextField('How Can I Help You?'),
                      _buildTextField('How Can I Help You?'),
                      _buildTextField('How Can I Help You?'),
                      _buildTextField('How Can I Help You?'),
                      SizedBox(height: 20),
                      _buildSectionTitle('About expectations'),
                      _buildTextField('How Can I Help You?'),
                      _buildTextField('How Can I Help You?'),
                      _buildTextField('How Can I Help You?'),
                      _buildTextField('How Can I Help You?'),
                      SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Send Answers'),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.black,
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FooterSection(),
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
      return screenWidth * 0.6;
    }
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hint,
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
