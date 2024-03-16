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
            decoration:
                BoxDecoration(shape: BoxShape.rectangle, border: Border.all()),
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(children: [
                Container(
                    width: 125,
                    height: 125,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            image: AssetImage(product.image),
                            fit: BoxFit.cover))),
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
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              product.seller,                         
                            ),
                            Text(
                              product.rating.toString(),                              
                              style: TextStyle(
                                  color: product.rating >= 3.5
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(context).colorScheme.error),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Icon(
                                Icons.star,
                                color: Theme.of(context).colorScheme.secondary,
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
