import 'package:dmpapp/models/product.dart';

class DataContext{
  Future<List<Product>> getProducts() async{
    return [Product(
      id: 0,
      name: "Splatoon 3",
      seller: "Nintendo",
      rating: 4.0,
      image: "assets/images/product.jpg"
    ),
    Product(
      id: 1,
      name: "1 2 Switch!",
      seller: "Nintendo",
      rating: 2.0,
      image: "assets/images/product.jpg"
    ),
    Product(
      id: 1,
      name: "Pikmin 4",
      seller: "Nintendo",
      rating: 4.2,
      image: "assets/images/product.jpg"
    )];
  }
}