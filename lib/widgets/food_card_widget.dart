import 'package:campus_dabba/screen/cook_profile.dart';
import 'package:campus_dabba/screen/dish_details_screen.dart';
import 'package:campus_dabba/type/dish.dart';
import 'package:campus_dabba/type/order.dart';
import 'package:campus_dabba/widgets/quantity_controll_widget.dart';
import 'package:flutter/material.dart';


class FoodCard extends StatefulWidget {
  final Dish dish;
  final OrderBasket orderBasket;
  final int initialQuantity;
  final void Function(String, int) onQuantityChange;

  const FoodCard({
    super.key,
    required this.dish,
    required this.orderBasket,
    required this.initialQuantity,
    required this.onQuantityChange,
  });

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  void quantityChangeAction(quantity) {
    widget.onQuantityChange(widget.dish.dishID, quantity);
  }

  void redirectToCookProfilePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CookProfileScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFE6DCCD),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cook info
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: redirectToCookProfilePage,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.dish.cookImage),
                    radius: 20,
                  ),
                  SizedBox(width: 8),
                  Text(
                    widget.dish.cookName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          // Food image
          GestureDetector(
            onTap: () => setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DishDetailsScreen(
                    dish: widget.dish,
                  ),
                ),
              );
            }),
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image(
                image: AssetImage(widget.dish.foodImage),
                height: 380,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Food name
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 8),
            child: Text(
              widget.dish.foodName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          // Rating and estimated time
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(widget.dish.estimatedTime),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber),
                    SizedBox(width: 4),
                    Text(widget.dish.rating.toStringAsFixed(1)),
                    SizedBox(width: 10),
                  ],
                ),
              ],
            ),
          ),
          // price and add button
          Padding(
            padding: EdgeInsets.only(left: 8, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.currency_rupee,
                      size: 19,
                    ),
                    Text(
                      widget.dish.price.toStringAsFixed(2),
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: QuantityControlWidget(
                    initialQuantity: widget.initialQuantity,
                    onQuantityChanged: (quantity) =>
                        quantityChangeAction(quantity),
                  ),
                )
              ],
            ),
          ),
          // Add dabba button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Add to cart functionality here
                },
                style: ElevatedButton.styleFrom(
                  // primary: Colors.orange,
                  foregroundColor: Color(0xFF3F2D20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
                child: Text(
                  'Add dabba',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3F2D20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

