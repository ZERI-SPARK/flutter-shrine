
import 'package:flutter/material.dart';
import 'package:shrine/model/product.dart';
import 'package:shrine/model/products_repository.dart';
import 'package:shrine/supplemental/asymmetric_view.dart';

class HomePage extends StatelessWidget {
    final Category category;
  const HomePage({Key? key , required this.category,}) : super(key: key);


  // TODO: Add a variable for Category (104)
  @override
  Widget build(BuildContext context) {
    // TODO: Pass Category variable to AsymmetricView (104)
    return AsymmetricView(
      products: ProductsRespository.loadProducts(category),
    );
  }
}
