import 'package:flutter/material.dart';

class CookProfileScreen extends StatelessWidget {
  const CookProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF5E0),
      appBar: AppBar(
        title: const Text('Cook Profile'),
        backgroundColor: const Color(0xFFFFF5E0),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileHeader(),
              const SizedBox(height: 24),
              _buildAboutSection(),
              const SizedBox(height: 24),
              _buildWhatImMakingSection(),
              const SizedBox(height: 24),
              _buildWeeklyDishSchedule(),
              const SizedBox(height: 24),
              _buildPopularDishes(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage("assets/cooks/cook_01.png"),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Anita',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              const Text(
                'Italian Cuisine Expert',
                style: TextStyle(fontSize: 16, color: Color(0xFF3F2D20)),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  _buildInfoChip(Icons.star, '4.8'),
                  const SizedBox(width: 8),
                  _buildInfoChip(Icons.restaurant, '17+ dishes'),
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

  Widget _buildAboutSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About Chef Anita',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          'Chef Anita has been passionate about Italian cuisine for over 20 years. '
          'She learned the art of pasta making from her grandmother in Naples and '
          'has since perfected her craft in some of the finest restaurants in Rome and Florence. '
          'Now, she brings her authentic Italian flavors right to your doorstep.',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildWhatImMakingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "What I'm Making",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildDayCard(
                'Today',
                [
                  'Spaghetti Carbonara',
                  'Tiramisu',
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildDayCard(
                'Tomorrow',
                [
                  'Margherita Pizza',
                  'Panna Cotta',
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDayCard(String day, List<String> dishes) {
    return Card(
      color: Color(0xFFE6DCCD),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              day,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...dishes.map((dish) => Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text(dish),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildWeeklyDishSchedule() {
    final days = [
      'Monday',
      'Tueday',
      'Wedday',
      'Thuday',
      'Friday',
      'Satday',
      'Sunday'
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Weekly Dish Schedule',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: days.length,
            itemBuilder: (context, index) {
              return Card(
                color: Color(0xFFE6DCCD),
                child: Container(
                  width: 100,
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        days[index],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      const Text('Pasta'),
                      const Text('Salad'),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPopularDishes() {
    final dishes = [
      {'name': 'Thepla', 'price': 90, 'image': 'assets/thepla.png'},
      {'name': 'Undhiyo', 'price': 120, 'image': 'assets/undhiyo.png'},
      {'name': 'Puran Poli', 'price': 70, 'image': 'assets/puran_poli.png'},
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
              color: Color(0xFFE6DCCD),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  // child: Image.network(
                  //   dish['image'] as String,
                  //   width: 60,
                  //   height: 60,
                  //   fit: BoxFit.cover,
                  // ),
                  child: Image.asset(
                    dish['image'] as String,
                    width: 60,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(dish['name'] as String),
                subtitle: Text('₹${dish['price']}'),
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
