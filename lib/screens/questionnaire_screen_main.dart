import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:living_without_shadows/screens/chat_screen.dart';
import 'package:living_without_shadows/screens/home_page.dart';
import 'package:living_without_shadows/screens/profile_screen.dart';
import 'package:living_without_shadows/screens/questionnaire_screen.dart';
import 'package:living_without_shadows/widgets/bottom_nav_bar.dart';
import '../widgets/footer_section.dart';
import 'package:living_without_shadows/screens/result_page.dart';

class QuestionnaireMain extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _controllers =
      List.generate(12, (index) => TextEditingController());

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
                  child: Form(
                    key: _formKey,
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
                        _buildTextField(
                            'Have your mood or energy levels changed recently?',
                            _controllers[0]),
                        _buildTextField('What emotions do you feel most days?',
                            _controllers[1]),
                        _buildTextField(
                            'Is it hard to find motivation or interest in things you used to enjoy?',
                            _controllers[2]),
                        SizedBox(height: 20),
                        _buildSectionTitle('About your future'),
                        _buildTextField(
                            'How do you feel about not knowing what will happen in the future?',
                            _controllers[3]),
                        _buildTextField(
                            'How do you feel about your achievements and goals so far?',
                            _controllers[4]),
                        _buildTextField(
                            'How do you feel when you imagine your dreams for the future?',
                            _controllers[5]),
                        SizedBox(height: 20),
                        _buildSectionTitle('About expectations'),
                        _buildTextField(
                            'How do you feel about the pressure to be successful?',
                            _controllers[6]),
                        _buildTextField(
                            'How do you feel when you challenge stereotypes or prejudices?',
                            _controllers[7]),
                        _buildTextField(
                            'How do you feel when you do not meet your own expectations?',
                            _controllers[8]),
                        SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            onPressed: () => _submitForm(context),
                            child: Text('Send Answers'),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Color.fromARGB(255, 112, 0, 193),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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

  Widget _buildTextField(String hint, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hint,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please fill out this field';
          }
          return null;
        },
      ),
    );
  }

  Future<void> _submitForm(BuildContext context) async {
    try {
      if (_formKey.currentState!.validate()) {
        List<String> responses =
            _controllers.map((controller) => controller.text).toList();

        final response = await http.post(
          Uri.parse('http://192.168.22.164:5000/analyze'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'responses': responses,
          }),
        );

        if (response.statusCode == 200) {
          final result = jsonDecode(response.body);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultPage(result: result),
            ),
          );
        } else {
          throw Exception('Failed to analyze responses');
        }
      }
    } catch (e) {
      print('Error submitting form: $e');
      // Mostrar mensaje de error al usuario o manejar de otra manera
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
