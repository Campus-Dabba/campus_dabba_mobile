import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Order> currentOrders =
      sampleOrders.where((order) => order.status != 'Delivered').toList();
  final List<Order> pastOrders =
      sampleOrders.where((order) => order.status == 'Delivered').toList();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF5E0),
      appBar: AppBar(
        title: const Text('My Orders'),
        backgroundColor: Color(0xFFFFF5E0),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Current Orders'),
            Tab(text: 'Past Orders'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          CurrentOrdersList(orders: currentOrders),
          PastOrdersList(orders: pastOrders),
        ],
      ),
    );
  }
}

class CurrentOrdersList extends StatelessWidget {
  final List<Order> orders;

  const CurrentOrdersList({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return CurrentOrderCard(order: orders[index]);
      },
    );
  }
}

class CurrentOrderCard extends StatelessWidget {
  final Order order;

  const CurrentOrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFE6DCCD),
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order #${order.id}',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text('${DateFormat.yMMMd().format(order.date)} - ${order.status}'),
            const SizedBox(height: 16),
            LinearProgressIndicator(value: _getProgressValue(order.status)),
            const SizedBox(height: 16),
            Text('Estimated delivery: ${_getEstimatedDelivery(order)}'),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF84BD93),
              ),
              onPressed: () => _viewOrderDetails(context),
              child: const Text(
                'View Details',
                style: TextStyle(
                  color: Color(0xFF3F2D20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _getProgressValue(String status) {
    switch (status) {
      case 'Preparing':
        return 0.25;
      case 'Ready for Pickup':
        return 0.5;
      case 'In Transit':
        return 0.75;
      case 'Delivered':
        return 1.0;
      default:
        return 0.0;
    }
  }

  String _getEstimatedDelivery(Order order) {
    // This is a placeholder. In a real app, you'd calculate this based on the order status and other factors.
    return DateFormat.jm().format(order.date.add(const Duration(minutes: 45)));
  }

  void _viewOrderDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderDetailScreen(order: order),
      ),
    );
  }
}

class PastOrdersList extends StatelessWidget {
  final List<Order> orders;

  const PastOrdersList({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return PastOrderCard(order: orders[index]);
      },
    );
  }
}

class PastOrderCard extends StatelessWidget {
  final Order order;

  const PastOrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFE6DCCD),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        title: Text('Order #${order.id}'),
        subtitle:
            Text('${DateFormat.yMMMd().format(order.date)} - ${order.status}'),
        trailing: Text('₹${order.total.toStringAsFixed(2)}'),
        onTap: () => _viewOrderDetails(context),
      ),
    );
  }

  void _viewOrderDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderDetailScreen(order: order),
      ),
    );
  }
}

class OrderDetailScreen extends StatelessWidget {
  final Order order;

  const OrderDetailScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF5E0),
      appBar: AppBar(
        title: Text('Order #${order.id}'),
        backgroundColor: Color(0xFFFFF5E0),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Date: ${DateFormat.yMMMd().format(order.date)}',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              Text('Status: ${order.status}',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 16),
              Text('Items:', style: Theme.of(context).textTheme.titleLarge),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: order.items.length,
                itemBuilder: (context, index) {
                  final item = order.items[index];
                  return ListTile(
                    title: Text(item.name),
                    trailing: Text('₹${item.price.toStringAsFixed(2)}'),
                  );
                },
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total:', style: Theme.of(context).textTheme.titleLarge),
                  Text('₹${order.total.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.titleLarge),
                ],
              ),
              const SizedBox(height: 24),
              if (order.status == 'Delivered')
                ElevatedButton(
                  onPressed: () => _reorder(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFE6DCCD),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    'Reorder',
                    style: TextStyle(color: Color(0xFF3F2D20)),
                  ),
                ),
              if (order.status != 'Delivered')
                ElevatedButton(
                  onPressed: () => _trackOrder(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFE6DCCD),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text('Track Order', style: TextStyle(color: Color(0xFF3F2D20)),),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _reorder(BuildContext context) {
    // Implement reorder functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Reorder functionality to be implemented')),
    );
  }

  void _trackOrder(BuildContext context) {
    // Implement order tracking functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Order tracking to be implemented')),
    );
  }
}

class Order {
  final int id;
  final DateTime date;
  final String status;
  final List<OrderItem> items;
  final double total;

  Order({
    required this.id,
    required this.date,
    required this.status,
    required this.items,
    required this.total,
  });
}

class OrderItem {
  final String name;
  final double price;

  OrderItem({required this.name, required this.price});
}

// Sample data
final List<Order> sampleOrders = [
  Order(
    id: 1001,
    date: DateTime.now().subtract(const Duration(days: 2)),
    status: 'Delivered',
    items: [
      OrderItem(name: 'Margherita Pizza', price: 12.99),
      OrderItem(name: 'Caesar Salad', price: 8.99),
    ],
    total: 21.98,
  ),
  Order(
    id: 1002,
    date: DateTime.now().subtract(const Duration(hours: 2)),
    status: 'In Transit',
    items: [
      OrderItem(name: 'Spaghetti Carbonara', price: 14.99),
      OrderItem(name: 'Tiramisu', price: 6.99),
    ],
    total: 21.98,
  ),
  Order(
    id: 1003,
    date: DateTime.now().subtract(const Duration(minutes: 30)),
    status: 'Preparing',
    items: [
      OrderItem(name: 'Chicken Curry', price: 13.99),
      OrderItem(name: 'Naan Bread', price: 3.99),
      OrderItem(name: 'Mango Lassi', price: 4.99),
    ],
    total: 22.97,
  ),
  Order(
    id: 1004,
    date: DateTime.now().subtract(const Duration(days: 5)),
    status: 'Delivered',
    items: [
      OrderItem(name: 'Beef Burger', price: 11.99),
      OrderItem(name: 'French Fries', price: 4.99),
      OrderItem(name: 'Chocolate Milkshake', price: 5.99),
    ],
    total: 22.97,
  ),
  Order(
    id: 1005,
    date: DateTime.now().subtract(const Duration(minutes: 45)),
    status: 'Ready for Pickup',
    items: [
      OrderItem(name: 'Vegetarian Sushi Platter', price: 18.99),
      OrderItem(name: 'Miso Soup', price: 3.99),
    ],
    total: 22.98,
  ),
];
