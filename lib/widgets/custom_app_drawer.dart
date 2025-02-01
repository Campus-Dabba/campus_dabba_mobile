import 'package:campus_dabba/screen/profile_screen.dart';
import 'package:campus_dabba/utils/auth_service.dart';
import 'package:flutter/material.dart';

class CustomAppDrawer extends StatelessWidget {
  const CustomAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFFFFF5E0),
      child: Column(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFFE6DCCD),
            ),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                'Campus Dabba',
                style: TextStyle(
                  color: Color(0xFF3F2D20),
                  fontSize: 24,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
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
                ListTile(
                  leading: Icon(Icons.restaurant_menu),
                  title: Text('Browse Cooks'),
                  onTap: () {
                    Navigator.pop(context);
                    // Add navigation logic here
                  },
                ),
                ListTile(
                  leading: Icon(Icons.receipt),
                  title: Text('My Orders'),
                  onTap: () {
                    Navigator.pop(context);
                    // Add navigation logic here
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () {
                    Navigator.pop(context);
                    // Add navigation logic here
                  },
                ),
              ],
            ),
          ),
          // Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              AuthService().signOut();
            },
          ),
        ],
      ),
    );
  }
}
