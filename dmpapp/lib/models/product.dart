class Product{
  final int id;
  final String name;
  final String seller;
  final double rating;
  final String image;

  Product(
    {
      required this.id, 
      required this.name,
      required this.seller,
      required this.rating,
      required this.image
    }
  );
}