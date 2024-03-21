import 'package:dmpapp/widgets/product_widgets/product_widget.dart';
import 'package:flutter/material.dart';

class ProductWidgetGrid extends ProductWidget {
  const ProductWidgetGrid({required super.product,required super.refresh ,super.key});

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
                                  color: product.rating >= colorRatingLimit
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(context).colorScheme.error),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                onFavoriteButtonPressed();
                              },
                              child: setButtonIcon(context),
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
