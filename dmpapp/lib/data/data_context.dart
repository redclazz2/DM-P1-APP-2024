import 'dart:convert';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:dmpapp/models/product.dart';
import 'package:http/http.dart' as http;

class DataContext {
  String url = 'http://10.0.2.2:5278/api/';

  Future<http.Response> loginUser(context,mail,password) async {
    var response = await http.post(Uri.parse("${url}User/Login"),
        body: jsonEncode(
          {'email': mail, 
          'password': password}),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        });
    return response;
  }

  Future<List<Product>> getProducts() async {
    
    
    
    return [
      Product(
          id: 0,
          name: "Splatoon 3",
          seller: "Nintendo",
          rating: 4.0,
          image: "assets/images/product.jpg"),
      Product(
          id: 1,
          name: "1 2 Switch!",
          seller: "Nintendo",
          rating: 2.0,
          image: "assets/images/product.jpg"),
      Product(
          id: 1,
          name: "Pikmin 4",
          seller: "Nintendo",
          rating: 4.2,
          image: "assets/images/product.jpg"),
      Product(
          id: 0,
          name: "Splatoon 3",
          seller: "Nintendo",
          rating: 4.0,
          image: "assets/images/product.jpg"),
      Product(
          id: 1,
          name: "1 2 Switch!",
          seller: "Nintendo",
          rating: 2.0,
          image: "assets/images/product.jpg"),
      Product(
          id: 1,
          name: "Pikmin 4",
          seller: "Nintendo",
          rating: 4.2,
          image: "assets/images/product.jpg"),
      Product(
          id: 0,
          name: "Splatoon 3",
          seller: "Nintendo",
          rating: 4.0,
          image: "assets/images/product.jpg"),
      Product(
          id: 1,
          name: "1 2 Switch!",
          seller: "Nintendo",
          rating: 2.0,
          image: "assets/images/product.jpg"),
      Product(
          id: 1,
          name: "Pikmin 4",
          seller: "Nintendo",
          rating: 4.2,
          image: "assets/images/product.jpg")
    ];
  }

  Future<List<Product>> getFavorites() async {
    return [
      Product(
          id: 0,
          name: "Splatoon 3",
          seller: "Nintendo",
          rating: 4.0,
          image: "assets/images/product.jpg")
    ];
  }
}
