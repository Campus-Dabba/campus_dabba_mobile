import 'package:flutter/material.dart';

class BrowseCookScreen extends StatefulWidget {
  const BrowseCookScreen({super.key});

  @override
  State<BrowseCookScreen> createState() => _BrowseCookScreenState();
}

class _BrowseCookScreenState extends State<BrowseCookScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Cook> cooks = [
    Cook("Anjali Sharma", "Uttar Pradesh", 4.8),
    Cook("Sneha Joshi", "Maharashtra", 4.6),
    Cook("Divya Krishnan", "Tamil Nadu", 4.7),
    Cook("Ishita Banerjee", "West Bengal", 4.9),
    Cook("Simran Kaur", "Punjab", 4.5),
    Cook("Aparna Nair", "Kerala", 4.1),
    Cook("Dhara Patel", "Gujarat", 4.2),
    Cook("Pooja Rathore", "Rajasthan", 4.4),
    Cook("Ritu Saikia", "Assam", 4.6),
    Cook("Lakshmi Rao", "Karnataka", 4.3),
  ];
  List<Cook> filteredCooks = [];

  @override
  void initState() {
    super.initState();
    filteredCooks = cooks;
  }

  void _filterCooks(String query) {
    setState(() {
      filteredCooks = cooks
          .where((cook) =>
              cook.name.toLowerCase().contains(query.toLowerCase()) ||
              cook.specialty.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF5E0),
      appBar: AppBar(
        title: const Text('Browse Cooks'),
        backgroundColor: Color(0xFFFFF5E0),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search cooks or cuisines...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onChanged: _filterCooks,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCooks.length,
              itemBuilder: (context, index) {
                return CookListItem(cook: filteredCooks[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

class Cook {
  final String name;
  final String specialty;
  final double rating;

  Cook(this.name, this.specialty, this.rating);
}

class CookListItem extends StatelessWidget {
  final Cook cook;

  const CookListItem({super.key, required this.cook});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFE6DCCD),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.orange.shade200,
          child: Text(
            cook.name[0],
            style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(cook.name),
        subtitle: Text(cook.specialty),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.star, color: Colors.amber),
            Text(cook.rating.toStringAsFixed(1)),
          ],
        ),
        onTap: () {
          // TODO: Implement cook detail view
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('You tapped on ${cook.name}')),
          );
        },
      ),
    );
  }
}