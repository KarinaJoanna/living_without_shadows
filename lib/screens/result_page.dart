import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final List<dynamic> result; // Lista de resultados

  ResultPage({required this.result});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Analysis Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildResultsTitle(),
            SizedBox(height: 20),
            _buildAnalysisSummaryCard(context),
            ...result.map((res) {
              return _buildResultCard(context, res);
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildResultsTitle() {
    return Center(
      child: Text(
        'Results',
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 82, 43, 121),
        ),
      ),
    );
  }

  Widget _buildAnalysisSummaryCard(BuildContext context) {
    return Center(
      child: SizedBox(
        width: _getCardWidth(context),
        child: Card(
          margin: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                  color: Colors.grey[200],
                ),
                child: Text(
                  'Analysis Summary',
                  style: TextStyle(
                    fontSize: _isSmallScreen(context) ? 20 : 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/qsection.jpg',
                height: 300,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResultCard(BuildContext context, dynamic res) {
    bool isNegative = res['label'] == 'NEGATIVE' && res['score'] > 0.8;
    return Center(
      child: SizedBox(
        width: _getCardWidth(context),
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 10),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Label: ${res['label']}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Score: ${res['score']}',
                      style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          isNegative ? Icons.warning : Icons.check_circle,
                          color: isNegative ? Colors.red : Colors.green,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            isNegative
                                ? 'The analysis suggests the person may be experiencing mental health issues.'
                                : 'The analysis suggests the person may be healthy.',
                            style: TextStyle(
                              fontSize: 18,
                              color: isNegative ? Colors.red : Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Image.asset(
                        isNegative ? 'assets/depression_image.jpg' : 'assets/healthy_image.jpg',
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 20),
                    if (isNegative)
                      ..._buildNegativeInfoCards(context)
                    else
                      ..._buildPositiveInfoCards(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildNegativeInfoCards(BuildContext context) {
    return [
      SizedBox(height: 20),
      _buildInfoCard(
        context,
        title: '5 Ways To Find Joy When You Are Depressed',
        description:
            'When you\'re in a depressive episode, it can feel as if depression has sucked the joy out of everything. So, in this blog post, we share 5 things you can do to find some of that missing joy when you feel depressed.',
        imagePath: 'assets/joy_depression.jpg',
      ),
      SizedBox(height: 20),
      _buildInfoCard(
        context,
        title: 'What Depression Looks Like In A Friendship',
        description:
            'In this blog post, we explain some of the most common ways that depression can affect people\'s friendships.',
        imagePath: 'assets/depression_friendship.jpg',
      ),
      SizedBox(height: 20),
      _buildInfoCard(
        context,
        title: 'How To Survive A Depressive Episode',
        description:
            'In this blog post, we\'ll explain exactly what you need to do to survive a depressive episode.',
        imagePath: 'assets/depressive_episode.jpg',
      ),
      SizedBox(height: 20),
      _buildInfoCard(
        context,
        title: 'Depression’s Vicious Cycle & The 5 Factors That Fuel It',
        description:
            'In this blog post, you’ll learn about depression’s vicious cycle, the five factors that fuel it, and what you need to do in order to break out of it.',
        imagePath: 'assets/mental_health_education.jpg',
      ),
      SizedBox(height: 20),
    ];
  }

  List<Widget> _buildPositiveInfoCards(BuildContext context) {
    return [
      SizedBox(height: 20),
      _buildInfoCard(
        context,
        title: '10 Tips for Maintaining Mental Health',
        description:
            'Learn about 10 practical tips that can help you maintain your mental health and well-being in your daily life.',
        imagePath: 'assets/mentalhealth.jpg',
      ),
      SizedBox(height: 20),
      _buildInfoCard(
        context,
        title: 'Building Strong Relationships for Mental Well-being',
        description:
            'Discover how building strong and healthy relationships can positively impact your mental well-being.',
        imagePath: 'assets/relationships.webp',
      ),
      SizedBox(height: 20),
      _buildInfoCard(
        context,
        title: 'The Importance of Physical Activity for Mental Health',
        description:
            'In this article, we explore the connection between physical activity and mental health, and how staying active can boost your mood.',
        imagePath: 'assets/physical_activity.jpg',
      ),
      SizedBox(height: 20),
      _buildInfoCard(
        context,
        title: 'Mindfulness Practices to Improve Your Mental Health',
        description:
            'Learn about various mindfulness practices that can help you manage stress and improve your overall mental health.',
        imagePath: 'assets/mindfulness.png',
      ),
      SizedBox(height: 20),
    ];
  }

  Widget _buildInfoCard(BuildContext context, {required String title, required String description, required String imagePath}) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              imagePath,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  description,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ResultPage(
      result: [
        {'label': 'NEGATIVE', 'score': 0.9},
        {'label': 'POSITIVE', 'score': 0.7},
      ],
    ),
  ));
}
