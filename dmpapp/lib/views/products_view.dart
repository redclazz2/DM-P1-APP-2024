import 'package:dmpapp/models/product.dart';
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
  List<Product> products = [];

  void handleLogOut() {
    Navigator.popAndPushNamed(context, "/login");
    data_lib.usersDB.deleteUserToken();
    data_lib.favoritesDB.deleteFavorites();
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

  void handleUpdateFavoriteState(){
    setState(() { });
  }

  void downloadProducts() async{
    data_lib.dataContext.getProducts().then((value) => {setState(() {
      products = value;
    })});
  }

  Future<List<Product>> getProductCache() async{
    return products;
  }

  @override
  void initState(){
    super.initState();
    handleTokenValidation();
    downloadProducts();
    data_lib.favoritesDB.handleFavoriteProducts();
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
                title = fromFavorites == 1 ? "Favorites" : "Featured";
                handleTokenValidation();
              });
              if(fromFavorites == -1) downloadProducts();
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
              ? getProductCache()
              : data_lib.favoritesDB.fetchFavoriteProducts(),
          builder: (context, snapshot) => snapshot.hasData
              ? (draw == -1)
                  ? ProductsWidgetList(products: snapshot.data!, refresh: handleUpdateFavoriteState,)
                  : ProductsWidgetGrid(products: snapshot.data!, refresh: handleUpdateFavoriteState,)
              : const Center(
                  child: CircularProgressIndicator(),
                )),
    );
  }
}
