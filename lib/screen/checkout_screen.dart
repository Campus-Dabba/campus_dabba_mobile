import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String selectedPaymentMethod = 'Credit Card';
  bool isLoading = false;

  // Mock data for order items 
  final List<Map<String, dynamic>> orderItems = [
    {'name': 'Bharli Vangi', 'quantity': 2, 'price': 190},
    {'name': 'Fafda Jalebi', 'quantity': 1, 'price': 80},
    {'name': 'Thepla', 'quantity': 1, 'price': 119},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF5E0),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFF5E0),
        title: const Text('Checkout'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildOrderSummary(),
              const SizedBox(height: 24),
              _buildDeliveryAddress(),
              const SizedBox(height: 24),
              _buildPaymentMethod(),
              const SizedBox(height: 24),
              _buildTotalAmount(),
              const SizedBox(height: 24),
              _buildPlaceOrderButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Card(
      color: Color(0xFFE6DCCD),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...orderItems.map((item) => _buildOrderItem(item)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItem(Map<String, dynamic> item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('${item['quantity']}x ${item['name']}'),
          Text('₹${(item['quantity'] * item['price']).toStringAsFixed(2)}'),
        ],
      ),
    );
  }

  Widget _buildDeliveryAddress() {
    return Card(
      color: Color(0xFFE6DCCD),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Delivery Address',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('Pradeep'),
            const Text('ittigati road, IIIT Dharwad'),
            const Text('Dharwad, Karnataka'),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {
                // TODO: Implement change address functionality
              },
              child: const Text('Change Address'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethod() {
    return Card(
      color: Color(0xFFE6DCCD),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Payment Method',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            DropdownButton<String>(
              focusColor: Color(0xFF84BD93),
              dropdownColor: Color(0xFFFFF5E0),
              value: selectedPaymentMethod,
              isExpanded: true,
              onChanged: (String? newValue) {
                setState(() {
                  selectedPaymentMethod = newValue!;
                });
              },
              items: <String>['Google Pay', 'PhonePe', 'Apple Pay', 'Credit Card']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalAmount() {
    double subtotal = orderItems.fold(0, (sum, item) => sum + (item['quantity'] * item['price']));
    double deliveryFee = 49.99;
    double total = subtotal + deliveryFee;

    return Card(
      color: Color(0xFFE6DCCD),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTotalRow('Subtotal', subtotal),
            _buildTotalRow('Delivery Fee', deliveryFee),
            const Divider(),
            _buildTotalRow('Total', total, isTotal: true),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalRow(String label, double amount, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 18 : 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            '₹${amount.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: isTotal ? 18 : 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildPlaceOrderButton() {
  //   return SizedBox(
  //     width: double.infinity,
  //     child: ElevatedButton(
  //       style: ButtonStyle(),
  //       onPressed: isLoading ? null : _placeOrder,
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(vertical: 16.0),
  //         child: Text(
  //           isLoading ? 'Processing...' : 'Place Order',
  //           style: const TextStyle(fontSize: 18),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildPlaceOrderButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : _placeOrder,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF84BD93),
          disabledBackgroundColor: const Color(0xFF84BD93).withOpacity(0.6),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            isLoading ? 'Processing...' : 'Place Order',
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }

  void _placeOrder() {
    setState(() {
      isLoading = true;
    });

    // TODO: Implement actual order placement logic here
    // This is a mock delay to simulate network request
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
      _showOrderConfirmation();
    });
  }

  void _showOrderConfirmation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Order Placed'),
          content: const Text('Your order has been successfully placed!'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                // TODO: Navigate to order tracking or home screen
              },
            ),
          ],
        );
      },
    );
  }
}