import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Campus Dabba"),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // TODO: Implement cart functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Lets eat!',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Categories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryButton(title: 'Pizza', icon: Icons.local_pizza),
                  CategoryButton(title: 'Burger', icon: Icons.fastfood),
                  CategoryButton(title: 'Sushi', icon: Icons.rice_bowl),
                  CategoryButton(title: 'Dessert', icon: Icons.cake),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Popular Restaurants',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            RestaurantCard(
              name: 'Pizza Palace',
              image: 'https://example.com/pizza.jpg',
              rating: 4.5,
              deliveryTime: '30-40 min',
            ),
            RestaurantCard(
              name: 'Burger Bonanza',
              image: 'https://example.com/burger.jpg',
              rating: 4.2,
              deliveryTime: '20-30 min',
            ),
            RestaurantCard(
              name: 'Sushi Supreme',
              image: 'https://example.com/sushi.jpg',
              rating: 4.8,
              deliveryTime: '40-50 min',
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String title;
  final IconData icon;

  const CategoryButton({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.orange[100],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon, size: 40, color: Colors.orange),
          ),
          SizedBox(height: 8),
          Text(title),
        ],
      ),
    );
  }
}

class RestaurantCard extends StatelessWidget {
  final String name;
  final String image;
  final double rating;
  final String deliveryTime;

  const RestaurantCard({
    super.key,
    required this.name,
    required this.image,
    required this.rating,
    required this.deliveryTime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            image,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow),
                    SizedBox(width: 4),
                    Text('$rating'),
                    SizedBox(width: 16),
                    Icon(Icons.access_time, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(deliveryTime),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
