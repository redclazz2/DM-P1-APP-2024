import 'package:dmpapp/models/product.dart';
import 'package:flutter/material.dart';

class ProductWidgetGrid extends StatelessWidget {
  final Product product;

  const ProductWidgetGrid({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: 150,
            height: 335,
            decoration:
                BoxDecoration(shape: BoxShape.rectangle, border: Border.all()),
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                SizedBox(
                  width: 125,
                  height: 125,
                  child: Image.network(
                    product.image,
                    errorBuilder: (context, error, stackTrace) =>
                        Image.asset("assets/images/product.jpg"),
                  ),
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Text(
                              product.name,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              product.seller,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              product.rating.toString(),
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
