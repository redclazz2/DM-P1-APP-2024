import 'package:dmpapp/data/data_context.dart';
import 'package:dmpapp/widgets/product_widget_grid.dart';
import 'package:dmpapp/widgets/product_widget_list.dart';
import 'package:flutter/material.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final DataContext dataContext = DataContext();
  int draw = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Featured"),
          actions: [
            ElevatedButton(
              onPressed: () {},
              child: Icon(
                Icons.star,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (draw == 0) {
                      draw = 1;
                    } else {
                      draw = 0;
                    }
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
            future: dataContext.getProducts(),
            builder: (context, snapshot) => snapshot.hasData
                ? draw == 0
                    ? ListView.separated(
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, index) =>
                            ProductWidgetList(product: snapshot.data![index]))
                    : SingleChildScrollView(
                        child: Center(
                        child: Wrap(children: [
                          for (var i = 0; i < snapshot.data!.length; i++)
                            ProductWidgetGrid(product: snapshot.data![i])
                        ]),
                      ))
                : const Center(
                    child: CircularProgressIndicator(),
                  )));
  }
}
