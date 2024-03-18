class Product{
  final int id;
  final String name;
  final String seller;
  final double rating;
  final String image;
  final bool isFavorite;

  Product(
    {
      required this.id, 
      required this.name,
      required this.seller,
      required this.rating,
      required this.image,
      required this.isFavorite,
    }
  );

  factory Product.fromSqfliteDatabase(Map<String,dynamic> map) =>
    Product(
      id: map['id'] ?? "",
      name: map['name'] ?? "",
      seller: map['seller'] ?? "",
      rating: (map["rating"]).toDouble(),
      image: map['image'] ?? "",
      isFavorite: map['isFavorite'] == 1 ? true : false,
    );
}