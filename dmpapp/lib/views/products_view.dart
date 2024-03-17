import 'package:dmpapp/data/data_context.dart';
import 'package:flutter/material.dart';

import '../widgets/products_builders/products_builders.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final DataContext dataContext = DataContext();
  String title = "Featured";
  int draw = -1;
  int fromFavorites = -1;

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
                });
              },
              child: const Icon(Icons.view_comfy)),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.logout))
        ],
      ),
      body: FutureBuilder(
          future: (fromFavorites == -1)
              ? dataContext.getProducts()
              : dataContext.getFavorites(),
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
