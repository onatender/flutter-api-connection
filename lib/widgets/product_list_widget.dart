import 'package:flutter/material.dart';
import 'package:http_demo/models/product.dart';
import 'package:http_demo/widgets/product_list_row.dart';

class ProductListWidget extends StatefulWidget {
  List<Product> products = [];
  
  ProductListWidget(List<Product> products) {
    this.products = products;
  }
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProductListWidgetState();
  }
}

class ProductListWidgetState extends State<ProductListWidget>{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.0,),
        SizedBox(
          height: MediaQuery.of(context).size.height/1.3,
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(widget.products.length ,(index) {
              return ProductListRowWidget(widget.products[index]);
            }),
          ),
        ),
      ],
    );
  }

}