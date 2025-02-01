import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
        backgroundColor: Colors.orange,
      ),
      body: OrderList(orders: sampleOrders),
    );
  }
}

class OrderList extends StatelessWidget {
  final List<Order> orders;

  const OrderList({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return OrderListItem(order: orders[index]);
      },
    );
  }
}

class OrderListItem extends StatelessWidget {
  final Order order;

  const OrderListItem({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        title: Text('Order #${order.id}'),
        subtitle: Text('${DateFormat.yMMMd().format(order.date)} - ${order.status}'),
        trailing: Text('\$${order.total.toStringAsFixed(2)}'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrderDetailScreen(order: order),
            ),
          );
        },
      ),
    );
  }
}

class OrderDetailScreen extends StatelessWidget {
  final Order order;

  const OrderDetailScreen({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order #${order.id}'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Date: ${DateFormat.yMMMd().format(order.date)}', style: Theme.of(context).textTheme.headline6),
            const SizedBox(height: 8),
            Text('Status: ${order.status}', style: Theme.of(context).textTheme.headline6),
            const SizedBox(height: 16),
            Text('Items:', style: Theme.of(context).textTheme.headline6),
            Expanded(
              child: ListView.builder(
                itemCount: order.items.length,
                itemBuilder: (context, index) {
                  final item = order.items[index];
                  return ListTile(
                    title: Text(item.name),
                    trailing: Text('\$${item.price.toStringAsFixed(2)}'),
                  );
                },
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total:', style: Theme.of(context).textTheme.headline6),
                Text('\$${order.total.toStringAsFixed(2)}', style: Theme.of(context).textTheme.headline6),
              ],
            ),
          ],
        ),
      ),
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
    date: DateTime.now().subtract(const Duration(days: 1)),
    status: 'In Transit',
    items: [
      OrderItem(name: 'Spaghetti Carbonara', price: 14.99),
      OrderItem(name: 'Tiramisu', price: 6.99),
    ],
    total: 21.98,
  ),
  Order(
    id: 1003,
    date: DateTime.now(),
    status: 'Preparing',
    items: [
      OrderItem(name: 'Chicken Curry', price: 13.99),
      OrderItem(name: 'Naan Bread', price: 3.99),
      OrderItem(name: 'Mango Lassi', price: 4.99),
    ],
    total: 22.97,
  ),
];