import 'dart:convert';
import 'dart:async';
import 'package:dmpapp/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

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
              image: "$url${p["image"]}",
              isFavorite: false
              ));
      }
    } catch (e) {
      data = [];
    }
    return data;
  }

  Future<List<Product>> getFavorites() async {
    List<Product> data = [];
    String token = await data_lib.usersDB.getUserToken();
    String roleKey = "http://schemas.microsoft.com/ws/2008/06/identity/claims/role";
    Map<String,dynamic> decodedToken = JwtDecoder.decode(token);

    try {
      final http.Response respuesta =
          await http.get(Uri.parse("${url}api/Products/${decodedToken[roleKey]}"), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'bearer $token'
      });

      List<dynamic> jsonDecoded = await json.decode(respuesta.body);

      for (var p in jsonDecoded) {
        data.add(
          Product(
              id: p["id"],
              name: p["name"],
              seller: p["seller"],
              rating: (p["rating"] as num).toDouble(),
              image: "$url${p["image"]}",
              isFavorite: true
              ));
      }
    } catch (e) {
      data = [];
    }
    return data;
  }
}
