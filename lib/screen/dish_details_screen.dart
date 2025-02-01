import 'package:campus_dabba/type/dish.dart';
import 'package:flutter/material.dart';

class DishDetailsScreen extends StatefulWidget {
  final Dish dish;

  const DishDetailsScreen({
    super.key,
    required this.dish,
  });

  @override
  State<DishDetailsScreen> createState() => _DishDetailsScreenState();
}

class _DishDetailsScreenState extends State<DishDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              // title: Text(widget.dish.foodName),
              background: Image.asset(
                widget.dish.foodImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.dish.foodName,
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.currency_rupee,
                            color: Colors.green,
                            size: 24,
                          ),
                          Text(
                            widget.dish.price.toStringAsFixed(2),
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber),
                          SizedBox(width: 4),
                          Text(
                            widget.dish.rating.toStringAsFixed(1),
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Description',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    // TODO: Dish discription
                    // widget.dish.description,
                    "haha a discription",

                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 24),
                  // Center(
                  //   child: QuantityControlWidget(
                  //     initialQuantity: widget.dish.quantity,
                  //     onQuantityChanged: (quantity) {
                  //       setState(() {
                  //         widget.dish.quantity = quantity;
                  //       });
                  //     },
                  //   ),
                  // ),
                  SizedBox(height: 24),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     // TODO: Implement add to cart functionality
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //       SnackBar(
                  //         content: Text(
                  //             'Added $widget.dish.quantity ${widget.dish.foodName} to cart'),
                  //       ),
                  //     );
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     minimumSize: Size(double.infinity, 50),
                  //   ),
                  //   child: Text('Add to Cart'),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
