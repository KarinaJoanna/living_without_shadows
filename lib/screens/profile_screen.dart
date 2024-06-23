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
                      color: Color.fromARGB(255, 84, 26, 125),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Icon(Icons.person, color: const Color.fromARGB(255, 115, 45, 148)),
                title: Text('Username'),
                subtitle: Text('Profile1'),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Icon(Icons.email, color:Color.fromARGB(255, 115, 45, 148)),
                title: Text('Email'),
                subtitle: Text('Profile1@example.com'),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Icon(Icons.phone, color:Color.fromARGB(255, 115, 45, 148)),
                title: Text('Phone'),
                subtitle: Text('+1 234 567 890'),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Icon(Icons.location_on, color:Color.fromARGB(255, 115, 45, 148)),
                title: Text('Address'),
                subtitle: Text('123'),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to edit profile screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfileScreen()),
                );
              },
              icon: Icon(Icons.edit),
              label: const Text('Edit Profile'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
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
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  title: Text(member.name),
                  subtitle: Text(
                      '${member.relationship}\n${member.email}\n${member.phone}'),
                  isThreeLine: true,
                ),
              );
            }).toList(),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _addCloseCircleMember,
              icon: Icon(Icons.add),
              label: const Text('Add Close Circle Member'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
