import 'package:flutter/material.dart';
import 'package:living_without_shadows/screens/chat_screen.dart';
import 'package:living_without_shadows/screens/questionnaire_screen.dart';
import 'package:living_without_shadows/widgets/header_section.dart';
import '../widgets/footer_section.dart';

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
                              color: Color(0xFFb4d4f3),
                            ),
                          ),
                          SizedBox(height: 10),
                          Image.asset('assets/qsection.jpg', height: 300),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'What is Depression?',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Depression is a common and serious medical illness that negatively affects how you feel, the way you think, and how you act. Fortunately, it is also treatable.',
                            style: TextStyle(fontSize: 16),
                          ),
                          TextButton(
                            onPressed: () {
                              // Acción para mostrar más información
                            },
                            child: Text('Learn More'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Symptoms of Depression',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Common symptoms include persistent sadness, loss of interest in activities once enjoyed, changes in appetite, trouble sleeping or sleeping too much, loss of energy, and feelings of worthlessness.',
                            style: TextStyle(fontSize: 16),
                          ),
                          TextButton(
                            onPressed: () {
                              // Acción para mostrar más información
                            },
                            child: Text('Learn More'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Statistics on Depression',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 200,
                    color: Colors.grey[200],
                    // Aquí podrías usar un paquete de gráficos para mostrar estadísticas
                    child: Center(
                      child: Text('Graph showing depression statistics'),
                    ),
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
                  Container(
                    height: 200,
                    color: Colors.grey[200],
                    // Aquí podrías incrustar un video usando un paquete como chewie o similar
                    child: Center(
                      child: Text('Video player placeholder'),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Frequently Asked Questions (FAQs)',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'What causes depression?',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Depression can result from a combination of genetic, biological, environmental, and psychological factors.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'How is depression treated?',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Depression is treatable through medications, psychotherapy, or a combination of both. It\'s important to consult a healthcare provider for a proper diagnosis and treatment plan.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FooterSection(),
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
