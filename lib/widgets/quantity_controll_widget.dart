import 'package:flutter/material.dart';


class QuantityControlWidget extends StatefulWidget {
  final int initialQuantity;
  final Function(int) onQuantityChanged;
  final int minQuantity;
  final int maxQuantity;

  const QuantityControlWidget({
    super.key,
    this.initialQuantity = 0,
    required this.onQuantityChanged,
    this.minQuantity = 0,
    this.maxQuantity = 99,
  });

  @override
  State<QuantityControlWidget> createState() => _QuantityControlWidgetState();
}

class _QuantityControlWidgetState extends State<QuantityControlWidget> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialQuantity;
  }

  void _incrementQuantity() {
    if (_quantity < widget.maxQuantity) {
      setState(() {
        _quantity++;
      });
      widget.onQuantityChanged(_quantity);
    }
  }

  void _decrementQuantity() {
    if (_quantity > widget.minQuantity) {
      setState(() {
        _quantity--;
      });
      widget.onQuantityChanged(_quantity);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildIconButton(
            icon: Icons.remove,
            onPressed: _decrementQuantity,
            isEnabled: _quantity > widget.minQuantity,
          ),
          SizedBox(
            width: 40,
            child: Text(
              '$_quantity',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildIconButton(
            icon: Icons.add,
            onPressed: _incrementQuantity,
            isEnabled: _quantity < widget.maxQuantity,
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback onPressed,
    required bool isEnabled,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: isEnabled ? onPressed : null,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Icon(
            icon,
            size: 20,
            color: isEnabled ? Colors.black : Colors.grey,
          ),
        ),
      ),
    );
  }
}
