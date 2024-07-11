class Shoe{
  final String name;
  final String price;
  final String imagePath;
  final String description;

  Shoe({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.description,
  });

  factory Shoe.fromJson(Map<String, dynamic> json) => Shoe(
    name: json["name"],
    price: json["price"],
    imagePath: json["imagePath"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "price": price,
    "imagePath": imagePath,
    "description": description,
  };
}