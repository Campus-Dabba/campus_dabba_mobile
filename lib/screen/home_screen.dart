import 'dart:convert';

import 'package:campus_dabba/screen/cart_screen.dart';
import 'package:campus_dabba/screen/search_screen.dart';
import 'package:campus_dabba/type/dish.dart';
import 'package:campus_dabba/type/order.dart';
import 'package:campus_dabba/utils/auth_service.dart';
import 'package:campus_dabba/widgets/category_button.dart';
import 'package:campus_dabba/widgets/food_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final _orderBasket = OrderBasket();

  void logoutFunction() {
    final auth = AuthService();
    auth.signOut();
  }

  void updateCartData(String dishID, int quantity) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? encodedCartData = prefs.getString('cart');

    Map<String, dynamic> cartData = {};

    if (encodedCartData != null) {
      cartData = json.decode(encodedCartData);
    }

    if ((quantity == 0) & cartData.containsKey(dishID)) {
      cartData.remove(dishID);
    } else {
      cartData[dishID] = quantity;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Campus Dabba"),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(
                    orderBasket: _orderBasket,
                  ),
                ),
              );
            },
          ),
          IconButton(
            onPressed: logoutFunction,
            icon: Icon(Icons.logout),
          )
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
                      Text('Search', style: TextStyle(color: Colors.grey)),
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
                  CategoryButton(title: 'Assam', icon: Icons.icecream),
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
              orderBasket: _orderBasket,
              dish: Dish(
                dishID: "anita-bharlivangi",
                cookName: "Anita",
                cookImage: "assets/cooks/cook_01.png",
                foodImage: "assets/bharli vangi.png",
                foodName: "Bharli Vangi",
                price: 190,
                rating: 4.8,
                estimatedTime: "20-25 min",
              ),
            ),
            FoodCard(
              orderBasket: _orderBasket,
              dish: Dish(
                dishID: "swati-fafdajalebi",
                cookName: "Swati",
                cookImage: "assets/cooks/cook_02.png",
                foodImage: "assets/fafda jalebi.png",
                foodName: "Fafda Jalebi",
                price: 80,
                rating: 4.2,
                estimatedTime: "45-50 min",
              ),
            ),
            FoodCard(
              orderBasket: _orderBasket,
              dish: Dish(
                dishID: "rupa-thepla",
                cookName: "Rupa",
                cookImage: "assets/cooks/cook_02.png",
                foodImage: "assets/thepla.png",
                foodName: "Thepla",
                price: 119,
                rating: 3.8,
                estimatedTime: "50-60 min",
              ),
            ),
            SizedBox(height: 100),
            Center(child: Text("looking for something else?")),
            SizedBox(height: 20),
          ],
        ),
      ),
      // bottomNavigationBar: CustomNavBarCurved(),
    );
  }
}
