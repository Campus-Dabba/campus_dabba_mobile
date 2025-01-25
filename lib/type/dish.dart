class Dish {
  String name;
  String description;
  double price;
  bool isVegetarian;
  int id;
  String image;

  Dish({
    required this.name,
    required this.description,
    required this.price,
    required this.isVegetarian,
    required this.id,
    required this.image,
  });

  // // Method to display dish details
  // void displayDetails() {
  //   print('Dish: $name');
  //   print('Description: $description');
  //   print('Price: \$${price.toStringAsFixed(2)}');
  //   print('Vegetarian: ${isVegetarian ? "Yes" : "No"}');
  // }
}
