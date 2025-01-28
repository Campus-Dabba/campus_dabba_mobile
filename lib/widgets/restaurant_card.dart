import 'package:flutter/material.dart';

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
