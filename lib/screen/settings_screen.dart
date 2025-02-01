import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _locationEnabled = true;
  String _selectedLanguage = 'English';
  String _selectedTheme = 'Light';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF5E0),
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Color(0xFFFFF5E0),
        elevation: 0,
      ),
      body: Container(
        color: Color(0xFFFFF5E0),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildCard(
              'Account',
              [
                _buildListTile(
                  'Profile',
                  'Manage your personal information',
                  Icons.person,
                  () => _showDialog('Edit Profile'),
                ),
                _buildListTile(
                  'Change Password',
                  'Update your account password',
                  Icons.lock,
                  () => _showDialog('Change Password'),
                ),
                _buildListTile(
                  'Linked Accounts',
                  'Connect with social media',
                  Icons.link,
                  () => _showDialog('Linked Accounts'),
                ),
              ],
            ),
            _buildCard(
              'Notifications',
              [
                SwitchListTile(
                  title: const Text('Push Notifications'),
                  subtitle: const Text('Receive alerts about your orders and offers'),
                  value: _notificationsEnabled,
                  onChanged: (value) {
                    setState(() {
                      _notificationsEnabled = value;
                    });
                  },
                  activeColor: Color(0xFF3F2D20),
                ),
                _buildListTile(
                  'Email Preferences',
                  'Manage your email notifications',
                  Icons.email,
                  () => _showDialog('Email Preferences'),
                ),
              ],
            ),
            _buildCard(
              'Payment',
              [
                _buildListTile(
                  'Payment Methods',
                  'Add or remove payment options',
                  Icons.payment,
                  () => _showDialog('Payment Methods'),
                ),
                _buildListTile(
                  'Addresses',
                  'Manage your delivery addresses',
                  Icons.location_on,
                  () => _showDialog('Manage Addresses'),
                ),
              ],
            ),
            _buildCard(
              'Privacy & Security',
              [
                SwitchListTile(
                  title: const Text('Location Services'),
                  subtitle: const Text('Allow app to access your location'),
                  value: _locationEnabled,
                  onChanged: (value) {
                    setState(() {
                      _locationEnabled = value;
                    });
                  },
                  activeColor: Color(0xFF3F2D20),
                  // inactiveThumbColor: Color(0xFF84BD93),
                ),
                _buildListTile(
                  'Data Usage',
                  'Manage how we use your data',
                  Icons.data_usage,
                  () => _showDialog('Data Usage Settings'),
                ),
                _buildListTile(
                  'Privacy Policy',
                  'Read our privacy policy',
                  Icons.privacy_tip,
                  () => _showDialog('Privacy Policy'),
                ),
              ],
            ),
            _buildCard(
              'App Settings',
              [
                ListTile(
                  title: const Text('Language'),
                  subtitle: Text(_selectedLanguage),
                  leading: const Icon(Icons.language, color: Color(0xFF3F2D20)),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () => _showLanguageDialog(),
                ),
                ListTile(
                  title: const Text('Theme'),
                  subtitle: Text(_selectedTheme),
                  leading: const Icon(Icons.palette, color: Color(0xFF3F2D20)),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () => _showThemeDialog(),
                ),
                _buildListTile(
                  'Clear Cache',
                  'Free up space on your device',
                  Icons.cleaning_services,
                  () => _showDialog('Clear Cache'),
                ),
              ],
            ),
            _buildCard(
              'Support',
              [
                _buildListTile(
                  'Help Center',
                  'Get help with using the app',
                  Icons.help,
                  () => _showDialog('Help Center'),
                ),
                _buildListTile(
                  'Report a Problem',
                  'Let us know if something isn\'t working',
                  Icons.report_problem,
                  () => _showDialog('Report a Problem'),
                ),
                _buildListTile(
                  'Terms of Service',
                  'Read our terms of service',
                  Icons.description,
                  () => _showDialog('Terms of Service'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _showLogoutDialog(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Log Out'),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'App Version 1.0.0',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, List<Widget> children) {
    return Card(
      color: Color(0xFFE6DCCD),
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3F2D20),
              ),
            ),
          ),
          ...children,
        ],
      ),
    );
  }

  Widget _buildListTile(String title, String subtitle, IconData icon, VoidCallback onTap) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: Icon(icon, color: Color(0xFF3F2D20)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  void _showDialog(String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text('This is a placeholder for the $title feature.'),
          actions: [
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Select Language'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                setState(() {
                  _selectedLanguage = 'English';
                });
                Navigator.pop(context);
              },
              child: const Text('English'),
            ),
            SimpleDialogOption(
              onPressed: () {
                setState(() {
                  _selectedLanguage = 'Spanish';
                });
                Navigator.pop(context);
              },
              child: const Text('Spanish'),
            ),
            SimpleDialogOption(
              onPressed: () {
                setState(() {
                  _selectedLanguage = 'French';
                });
                Navigator.pop(context);
              },
              child: const Text('French'),
            ),
          ],
        );
      },
    );
  }

  void _showThemeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Select Theme'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                setState(() {
                  _selectedTheme = 'Light';
                });
                Navigator.pop(context);
              },
              child: const Text('Light'),
            ),
            SimpleDialogOption(
              onPressed: () {
                setState(() {
                  _selectedTheme = 'Dark';
                });
                Navigator.pop(context);
              },
              child: const Text('Dark'),
            ),
            SimpleDialogOption(
              onPressed: () {
                setState(() {
                  _selectedTheme = 'System Default';
                });
                Navigator.pop(context);
              },
              child: const Text('System Default'),
            ),
          ],
        );
      },
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Log Out'),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Log Out'),
              onPressed: () {
                // Implement logout functionality here
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logged out successfully')),
                );
              },
            ),
          ],
        );
      },
    );
  }
}