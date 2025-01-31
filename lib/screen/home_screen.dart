import 'package:campus_dabba/screen/cart_screen.dart';
import 'package:campus_dabba/screen/search_screen.dart';
import 'package:campus_dabba/widgets/category_button.dart';
import 'package:campus_dabba/widgets/food_card_widget.dart';
import 'package:campus_dabba/widgets/restaurant_card.dart';
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
                      Text('Search...', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchScreen()),
                  );
                },
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
                'Discover cooks',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            FoodCard(
              cookName: "Anita",
              cookImageUrl: "assets/cooks/cook_01.png",
              foodImageUrl: "assets/bharli vangi.png",
              foodName: "Bharli Vangi",
              rating: 4.8,
              estimatedTime: "20-25 min",
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
