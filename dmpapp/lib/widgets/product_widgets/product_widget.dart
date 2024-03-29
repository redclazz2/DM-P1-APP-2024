import 'package:dmpapp/models/product.dart';
import 'package:flutter/material.dart';
import '../../libraries/data_lib.dart' as data_lib;

abstract class ProductWidget extends StatelessWidget {
  final Product product;
  final double colorRatingLimit = 3.6;
  final Function refresh;

  const ProductWidget({required this.product, required this.refresh,super.key});

  Widget setButtonIcon(context) {
    return Icon(
      product.isFavorite ? Icons.not_interested : Icons.star,
      color: product.isFavorite
          ? Theme.of(context).colorScheme.error
          : Theme.of(context).colorScheme.secondary,
    );
  }

  void onFavoriteButtonPressed(){
    if (!product.isFavorite) {
      data_lib.favoritesDB.fetchFavoriteProduct(product.id).then((value) => {
            if (value == null)
              {
                data_lib.favoritesDB.insertFavoriteProduct(
                    product: Product(
                        id: product.id,
                        name: product.name,
                        seller: product.seller,
                        rating: product.rating,
                        image: product.image,
                        isFavorite: true))
              }
          });
      
      data_lib.dataContext.createFavorite(product.id);
    } else {
      data_lib.favoritesDB.deleteFavorite(product.id);
      data_lib.dataContext.deleteFavorite(product.id);
      refresh();
    }
  }

  @override
  Widget build(BuildContext context);
}
