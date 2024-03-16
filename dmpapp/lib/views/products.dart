import 'package:dmpapp/data/data_context.dart';
import 'package:dmpapp/widgets/product_widget_list.dart';
import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  final String viewName = "Placeholder";
  final DataContext dataContext = DataContext();
  int viewStyle = 0;

  ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(viewName),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Log Out"))
          ],
        ),
        body: FutureBuilder(
            future: dataContext.getProducts(),
            builder: (context, snapshot) => snapshot.hasData
                ? ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, index) =>
                        ProductWidgetList(product: snapshot.data![index]))
                : const Center(
                    child: CircularProgressIndicator(),
                  )));
  }
}
