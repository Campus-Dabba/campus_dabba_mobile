// import 'package:campus_dabba/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Campus Dabba"),
        // leading: Icon(Icons.person),
        elevation: 0.5,
        actions: [
          Icon(Icons.search),
          SizedBox(width: 10),
          Icon(Icons.shopping_cart_outlined),
          SizedBox(width: 10),
          Icon(Icons.menu),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 15),
            child: Text("Explore"),
          ),
          Divider(),
        ],
      ),
    );
  }
}
