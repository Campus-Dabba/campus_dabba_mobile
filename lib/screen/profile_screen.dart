import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF5E0),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFF5E0),
        title: const Text('My Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // TODO: Implement edit profile functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 20),
            _buildSectionTitle('Account Information'),
            _buildAccountInfo(),
            const SizedBox(height: 20),
            _buildSectionTitle('Order History'),
            _buildOrderHistory(),
            const SizedBox(height: 20),
            _buildSectionTitle('Favorite Cooks'),
            _buildFavoriteRestaurants(),
            const SizedBox(height: 20),
            _buildSectionTitle('Settings'),
            _buildSettings(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        color: Color(0xFFFFF5E0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              // backgroundImage: NetworkImage('https://example.com/profile_picture.jpg'),
              backgroundImage: AssetImage("assets/cooks/cook_01.png"),
            ),
            const SizedBox(height: 10),
            const Text(
              'Shalini Kumar',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3F2D20),
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Shalini02@gmail.com',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF3F2D20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildAccountInfo() {
    return Card(
      color: Color(0xFFE6DCCD),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildInfoRow('Phone', '+91 123 456 7890'),
            _buildInfoRow('Address', 'Ittigari Road, Dharwad, Karnataka'),
            _buildInfoRow('Member Since', 'January 2023'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildOrderHistory() {
    final List<Map<String, String>> orders = [
      {'restaurant': 'Mamoni', 'date': '2024-01-25', 'amount': '₹120'},
      {'restaurant': 'Vandhana', 'date': '2024-01-23', 'amount': '₹233'},
      {'restaurant': 'Radhika', 'date': '2024-01-20', 'amount': '₹345'},
    ];

    return Card(
      color: Color(0xFFE6DCCD),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return ListTile(
            title: Text(order['restaurant']!),
            subtitle: Text(order['date']!),
            trailing: Text(order['amount']!),
            onTap: () {
              // TODO: Implement order details view
            },
          );
        },
      ),
    );
  }

  Widget _buildFavoriteRestaurants() {
    final List<Map<String, String>> restaurants = [
      {'name': 'Mamoni', 'cuisine': 'Bengoli'},
      {'name': 'Radhika', 'cuisine': 'Maharastran'},
      {'name': 'Champpa', 'cuisine': 'South Indian'},
    ];

    return Card(
      color: Color(0xFFE6DCCD),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          final restaurant = restaurants[index];
          return ListTile(
            title: Text(restaurant['name']!),
            subtitle: Text(restaurant['cuisine']!),
            trailing: const Icon(Icons.favorite, color: Colors.red),
            onTap: () {
              // TODO: Implement restaurant details view
            },
          );
        },
      ),
    );
  }

  Widget _buildSettings() {
    return Card(
      color: Color(0xFFE6DCCD),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            trailing: Switch(
              value: true,
              onChanged: (value) {
                // TODO: Implement notification settings
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Language'),
            trailing: const Text('English'),
            onTap: () {
              // TODO: Implement language selection
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Privacy Settings'),
            onTap: () {
              // TODO: Implement privacy settings
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Help & Support'),
            onTap: () {
              // TODO: Implement help & support
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Log Out'),
            onTap: () {
              // TODO: Implement log out functionality
            },
          ),
        ],
      ),
    );
  }
}