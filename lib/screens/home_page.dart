import 'package:flutter/material.dart';
import '../widgets/header_section.dart';
import '../widgets/questionnaire_section.dart';
import '../widgets/talk_about_depression_section.dart';
import '../widgets/empowering_knowledge_section.dart';
import '../widgets/inspirational_quote_section.dart';
import '../widgets/chat_section.dart';
import '../widgets/footer_section.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HeaderSection(),
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
          ),
        ],
      ),
    );
  }
}
