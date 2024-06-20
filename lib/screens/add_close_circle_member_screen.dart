import 'package:flutter/material.dart';
import '../models/close_circle_member.dart';

class AddCloseCircleMemberScreen extends StatefulWidget {
  final Function(CloseCircleMember) onAddMember;

  const AddCloseCircleMemberScreen({required this.onAddMember, Key? key})
      : super(key: key);

  @override
  _AddCloseCircleMemberScreenState createState() =>
      _AddCloseCircleMemberScreenState();
}

class _AddCloseCircleMemberScreenState
    extends State<AddCloseCircleMemberScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  String _relationship = 'Friend';

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      final newMember = CloseCircleMember(
        name: _nameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        relationship: _relationship,
      );
      widget.onAddMember(newMember);
      Navigator.pop(context);
    }
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
        title: const Text('Add Close Circle Member'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                      'Your close circle members are important to you for your growth and well-being.',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFb4d4f3),
                      ),
                    ),
                    SizedBox(height: 10),
                    Image.asset('assets/empoweing.png'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: 'Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _phoneController,
                      decoration: const InputDecoration(labelText: 'Phone'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a phone number';
                        }
                        return null;
                      },
                    ),
                    DropdownButtonFormField<String>(
                      value: _relationship,
                      decoration:
                          const InputDecoration(labelText: 'Relationship'),
                      items: <String>['Friend', 'Family', 'Other']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _relationship = newValue!;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => _submit(),
                      child: const Text('Add Member'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
