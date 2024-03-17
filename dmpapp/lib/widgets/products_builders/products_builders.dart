import 'package:dmpapp/widgets/product_widgets/product_widget_list.dart';
import 'package:flutter/material.dart';

import '../../models/product.dart';
import '../product_widgets/product_widget_grid.dart';

abstract class ProductsWidget extends StatelessWidget {
  final List<Product> products;

  const ProductsWidget({required this.products, super.key});
}

class ProductsWidgetList extends ProductsWidget {
  const ProductsWidgetList({required super.products, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: products.length,
        itemBuilder: (BuildContext context, index) =>
            ProductWidgetList(product: products[index]));
  }
}

class ProductsWidgetGrid extends ProductsWidget {
  const ProductsWidgetGrid({required super.products, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
      child: Wrap(children: [
        for (var i = 0; i < products.length; i++)
          ProductWidgetGrid(product: products[i])
      ]),
    ));
  }
}
