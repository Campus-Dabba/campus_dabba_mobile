import 'package:campus_dabba/screen/cart_page.dart';
import 'package:campus_dabba/screen/search_screen.dart';
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
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
              child: GestureDetector(
                child: Hero(
                  tag: "search-bar",
                  // child: TextField(
                  //   decoration: InputDecoration(
                  //     hintText: 'Lets eat!',
                  //     prefixIcon: Icon(Icons.search),
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(20),
                  //     ),
                  //   ),
                  // ),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey),
                        SizedBox(width: 8),
                        Text('Search for restaurants or foods',
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchScreen()),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'States',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryButton(title: 'Panjabi', icon: Icons.local_pizza),
                  CategoryButton(title: 'Gujrati', icon: Icons.fastfood),
                  CategoryButton(title: 'Bengoli', icon: Icons.rice_bowl),
                  CategoryButton(title: 'Maharastran', icon: Icons.cake),
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
              name: 'Panjabi',
              image: 'assets/fafda jalebi.png',
              rating: 4.5,
              deliveryTime: '30-40 min',
            ),
            RestaurantCard(
              name: 'Burger Bonanza',
              image: 'assets/fafda jalebi.png',
              rating: 4.2,
              deliveryTime: '20-30 min',
            ),
            RestaurantCard(
              name: 'Sushi Supreme',
              image: 'assets/fafda jalebi.png',
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
          // Image.network(
          //   image,
          //   height: 200,
          //   width: double.infinity,
          //   fit: BoxFit.cover,
          // ),
          Image(
            image: AssetImage(image),
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
