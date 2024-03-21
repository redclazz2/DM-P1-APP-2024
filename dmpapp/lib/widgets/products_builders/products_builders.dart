import 'package:dmpapp/widgets/product_widgets/product_widget_list.dart';
import 'package:flutter/material.dart';

import '../../models/product.dart';
import '../product_widgets/product_widget_grid.dart';

abstract class ProductsWidget extends StatelessWidget {
  final List<Product> products;
  final Function refresh;

  const ProductsWidget({required this.products, 
    required this.refresh, 
    super.key});
}

class ProductsWidgetList extends ProductsWidget {
  const ProductsWidgetList({required super.products, required super.refresh, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: products.length,
        itemBuilder: (BuildContext context, index) =>
            ProductWidgetList(product: products[index], refresh: refresh,));
  }
}

class ProductsWidgetGrid extends ProductsWidget {
  const ProductsWidgetGrid({required super.products, required super.refresh, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
      child: Wrap(
        spacing: 2,
        children: [
        for (var i = 0; i < products.length; i++)
          ProductWidgetGrid(product: products[i], refresh: refresh,)
      ]),
    ));
  }
}
