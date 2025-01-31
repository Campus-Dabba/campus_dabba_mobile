import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final String cookName;
  final String cookImageUrl;
  final String foodImageUrl;
  final String foodName;
  final double rating;
  final String estimatedTime;

  const FoodCard({
    super.key,
    required this.cookName,
    required this.cookImageUrl,
    required this.foodImageUrl,
    required this.foodName,
    required this.rating,
    required this.estimatedTime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cook info
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(cookImageUrl),
                  radius: 20,
                ),
                SizedBox(width: 8),
                Text(
                  cookName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // Food image
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image(
              image: AssetImage(foodImageUrl),
              height: 400,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Food name
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              foodName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          // Rating and estimated time
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber),
                    SizedBox(width: 4),
                    Text(rating.toStringAsFixed(1)),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.access_time, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(estimatedTime),
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
