import 'package:flutter/material.dart';
import '../widgets/products_builders/products_builders.dart';

import '../../libraries/data_lib.dart' as data_lib;

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  String title = "Featured";
  int draw = -1;
  int fromFavorites = -1;

  void handleLogOut() {
    Navigator.popAndPushNamed(context, "/login");
    data_lib.usersDB.deleteUserToken();
  }

  void handleTokenValidation(){
    data_lib.usersDB.validateTokenDate().then(
      (value){
        if(!value){
          handleLogOut();
        }
      }
    );
  }

  @override
  void initState(){
    super.initState();
    handleTokenValidation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(title),
        actions: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                fromFavorites *= -1;
                if (fromFavorites == 1) {
                  title = "Favorites";
                } else {
                  title = "Featured";
                }
                handleTokenValidation();
              });
            },
            child: Icon(
              Icons.star,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  draw *= -1;
                  handleTokenValidation();
                });
              },
              child: const Icon(Icons.view_comfy,
                  color: Color.fromARGB(255, 69, 133, 136))),
          ElevatedButton(
              onPressed: () {
                handleLogOut();
              },
              child: Icon(Icons.logout,
                  color: Theme.of(context).colorScheme.error))
        ],
      ),
      body: FutureBuilder(
          future: (fromFavorites == -1)
              ? data_lib.dataContext.getProducts()
              : data_lib.dataContext.getFavorites(),
          builder: (context, snapshot) => snapshot.hasData
              ? (draw == -1)
                  ? ProductsWidgetList(products: snapshot.data!)
                  : ProductsWidgetGrid(products: snapshot.data!)
              : const Center(
                  child: CircularProgressIndicator(),
                )),
    );
  }
}
