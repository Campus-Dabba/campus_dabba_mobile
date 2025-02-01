import 'package:flutter/material.dart';

// Food model
class Food {
  final String name;
  final String category;
  final double price;

  Food({required this.name, required this.category, required this.price});
}

// Sample food data
final List<Food> allFoods = [
  Food(name: 'Bharli Vangi', category: 'Marathi', price: 79),
  Food(name: 'Fafda Jalebi', category: 'Marathi', price: 50),
  Food(name: 'Khandvi', category: 'Gujrati', price: 110),
  Food(name: 'Missal Pav', category: 'Maharastran', price: 120),
  Food(name: 'Puran Poli', category: 'Gujrati', price: 70),
  Food(name: 'Thepla', category: 'Gujrati', price: 50),
  Food(name: 'Egg Curry', category: 'Bengoli', price: 40),
  Food(name: 'undhiyo', category: 'South Indian', price: 80),
];

class SearchFoodScreen extends StatefulWidget {
  const SearchFoodScreen({super.key});

  @override
  State<SearchFoodScreen> createState() => _SearchFoodScreenState();
}

class _SearchFoodScreenState extends State<SearchFoodScreen> {
  List<Food> displayedFoods = allFoods;
  final TextEditingController _searchController = TextEditingController();

  void _filterFoods(String query) {
    setState(() {
      displayedFoods = allFoods
          .where((food) =>
              food.name.toLowerCase().contains(query.toLowerCase()) ||
              food.category.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6DCCD),
      appBar: AppBar(
        title: const Text('Search Food'),
        backgroundColor: Color(0xFFE6DCCD),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for food...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onChanged: _filterFoods,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: displayedFoods.length,
              itemBuilder: (context, index) {
                final food = displayedFoods[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(
                      food.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(food.category),
                    trailing: Text(
                      '\$${food.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: CircleAvatar(
                      backgroundColor: Colors.orange.shade100,
                      child: Text(
                        food.name[0],
                        style: TextStyle(color: Colors.orange.shade800),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

