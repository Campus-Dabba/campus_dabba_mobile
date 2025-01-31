class Dish {
  final String dishID;
  final String foodName;
  final String cookName;
  final String foodImage;
  final String cookImage;
  final double price;
  final double rating;
  final String estimatedTime;
  int quantity;

  Dish({
    required this.dishID,
    required this.foodName,
    required this.cookName,
    required this.foodImage,
    required this.cookImage,
    required this.price,
    required this.rating,
    required this.estimatedTime,
    this.quantity = 0,
  });

  // // Method to display dish details
  // void displayDetails() {
  //   print('Dish: $name');
  //   print('Description: $description');
  //   print('Price: \$${price.toStringAsFixed(2)}');
  //   print('Vegetarian: ${isVegetarian ? "Yes" : "No"}');
  // }
}
