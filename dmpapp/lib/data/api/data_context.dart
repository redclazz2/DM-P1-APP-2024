import 'dart:convert';
import 'dart:async';
import 'package:dmpapp/models/product.dart';
import 'package:http/http.dart' as http;

import '../../libraries/data_lib.dart' as data_lib;

class DataContext {
  String url = 'http://10.0.2.2:5278/';

  Future<http.Response> loginUser(context, mail, password) async {
    var response = await http.post(Uri.parse("${url}api/Users/Login"),
        body: jsonEncode({'email': mail, 'password': password}),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        });
    return response;
  }

  Future<List<Product>> getProducts() async {
    List<Product> data = [];

    try {
      final http.Response respuesta =
          await http.get(Uri.parse("${url}api/Products"), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'bearer ${await data_lib.usersDB.getUserToken()}'
      });

      List<dynamic> jsonDecoded = await json.decode(respuesta.body);

      for (var p in jsonDecoded) {
        data.add(
          Product(
              id: p["id"],
              name: p["name"],
              seller: p["seller"],
              rating: (p["rating"] as num).toDouble(),
              image: "$url${p["image"]}"
              ));
      }
    } catch (e) {
      data = [];
    }
    return data;
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
