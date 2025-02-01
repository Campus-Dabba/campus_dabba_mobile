import 'package:flutter/material.dart';

class CookProfileScreen extends StatelessWidget {
  const CookProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCookInfo(),
                  const SizedBox(height: 24),
                  _buildCookBio(),
                  const SizedBox(height: 24),
                  _buildSpecialties(),
                  const SizedBox(height: 24),
                  _buildDishList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text('Chef Maria'),
        background: Image.network(
          'https://example.com/chef_maria_background.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildCookInfo() {
    return Row(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage('https://example.com/chef_maria_profile.jpg'),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Chef Maria',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              const Text(
                'Italian Cuisine Expert',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  _buildInfoChip(Icons.star, '4.8'),
                  const SizedBox(width: 8),
                  _buildInfoChip(Icons.access_time, '30 min'),
                  const SizedBox(width: 8),
                  _buildInfoChip(Icons.restaurant, '50+ dishes'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16),
          const SizedBox(width: 4),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildCookBio() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About Chef Maria',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          'Chef Maria has been passionate about Italian cuisine for over 20 years. '
          'She learned the art of pasta making from her grandmother in Naples and '
          'has since perfected her craft in some of the finest restaurants in Rome and Florence. '
          'Now, she brings her authentic Italian flavors right to your doorstep.',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildSpecialties() {
    final specialties = ['Pasta', 'Pizza', 'Risotto', 'Seafood'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Specialties',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: specialties
              .map((specialty) => Chip(
                    label: Text(specialty),
                    backgroundColor: const Color(0xFF84BD93),
                    labelStyle: const TextStyle(color: Colors.white),
                  ))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildDishList() {
    final dishes = [
      {'name': 'Spaghetti Carbonara', 'price': 14.99, 'image': 'https://example.com/carbonara.jpg'},
      {'name': 'Margherita Pizza', 'price': 12.99, 'image': 'https://example.com/margherita.jpg'},
      {'name': 'Risotto ai Funghi', 'price': 16.99, 'image': 'https://example.com/risotto.jpg'},
      {'name': 'Osso Buco', 'price': 22.99, 'image': 'https://example.com/ossobuco.jpg'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Popular Dishes',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: dishes.length,
          itemBuilder: (context, index) {
            final dish = dishes[index];
            return Card(
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    dish['image'] as String,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(dish['name'] as String),
                subtitle: Text('\$${dish['price']}'),
                trailing: IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  color: const Color(0xFF84BD93),
                  onPressed: () {
                    // TODO: Implement add to cart functionality
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

