

class DishOrder {
  final String orderID;
  // final String dishName;
  final int quantity;
  // final double price;

  DishOrder({
    required this.orderID,
    // required this.dishName,
    required this.quantity,
    // required this.price,
  });

  // double get totalPrice => quantity * price;

  // @override
  // String toString() =>
  //     'Dish: $dishName, Quantity: $quantity, Price: $price, Total: $totalPrice';
}



class OrderBasket {
  final List<DishOrder> orders = [];

  void addOrder(DishOrder order) {
    orders.add(order);
  }

  void removeOrder(DishOrder order) {
    orders.remove(order);
  }

  // double get totalCost {
  //   return orders.fold(0, (sum, order) => sum + order.totalPrice);
  // }

  // @override
  // String toString() {
  //   return orders.isEmpty
  //       ? 'No orders yet.'
  //       : orders.map((order) => order.toString()).join('\n');
  // }
}
