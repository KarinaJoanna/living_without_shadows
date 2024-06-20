import 'package:flutter/material.dart';
import 'package:living_without_shadows/widgets/bottom_nav_bar.dart';
import '../models/close_circle_member.dart';
import 'add_close_circle_member_screen.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<CloseCircleMember> closeCircle = [];

  void _addCloseCircleMember() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddCloseCircleMemberScreen(
          onAddMember: (member) {
            setState(() {
              closeCircle.add(member);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/empowering.png'),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Profile1',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Profile1@example.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('Username'),
              subtitle: Text('Profile1'),
            ),
            const ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              subtitle: Text('Profile1@example.com'),
            ),
            const ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
              subtitle: Text('+1 234 567 890'),
            ),
            const ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Address'),
              subtitle: Text('123'),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Navigate to edit profile screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfileScreen()),
                );
              },
              child: const Text('Edit Profile'),
            ),
            const SizedBox(height: 32),
            const Text(
              'Close Circle',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ...closeCircle.map((member) {
              return ListTile(
                title: Text(member.name),
                subtitle: Text(
                    '${member.relationship}\n${member.email}\n${member.phone}'),
                isThreeLine: true,
              );
            }).toList(),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _addCloseCircleMember,
              child: const Text('Add Close Circle Member'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
