import 'package:flutter/material.dart';
import 'package:http_demo/models/product.dart';

class ProductListRowWidget extends StatelessWidget {

  Product product;
  ProductListRowWidget(this.product);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return buildProductItemCard(context);

  }
  
  Widget buildProductItemCard(BuildContext context) {
    return InkWell(
        child: Card(
          child: Column(
            children: [
              Container(
                child: Image.network("https://nbg.seagate.com/content/dam/seagate/migrated-assets/www-content/products/external-hard-drives/one-touch-external-drives/_shared/images/bup-portable-black-bob.png"),
                height: 130,
                width: MediaQuery.of(context).size.width/2,
              ),
              Text(product.productName!),
              Text(product.unitPrice.toString(),style: TextStyle(fontSize: 18,color: Colors.grey),)
            ],
          ),
        ),
    );
  }

}