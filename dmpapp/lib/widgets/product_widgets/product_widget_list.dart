import 'package:dmpapp/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductWidgetList extends StatelessWidget {
  final Product product;

  const ProductWidgetList({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.all(1),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.network(
                    product.image,
                    errorBuilder: (context, error, stackTrace) =>
                        Image.asset("assets/images/product.jpg"),
                  ),
                ),
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          textAlign: TextAlign.left,
                          product.name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          product.seller,
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          product.rating.toString(),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: product.rating >= 3.5
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.error),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Icon(
                            product.isFavorite
                                ? Icons.not_interested
                                : Icons.star,
                            color: product.isFavorite
                                ? Theme.of(context).colorScheme.error
                                : Theme.of(context).colorScheme.secondary,
                          ),
                        )
                      ],
                    ),
                  )
                ])
              ]),
            ))
      ],
    );
  }
}
