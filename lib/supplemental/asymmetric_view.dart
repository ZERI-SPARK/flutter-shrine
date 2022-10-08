import 'package:flutter/material.dart';
import 'package:shrine/model/product.dart';
import 'product_columns.dart';

class AsymmetricView extends StatelessWidget {
  final List<Product> products;

  const AsymmetricView({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.fromLTRB(0.0, 34.0, 16.0, 44.0),
      children: _buildColumns(context),
    );
  }

  List<Widget> _buildColumns(BuildContext context) {
    if (products.isEmpty) {
      return <Container>[];
    }

    return List.generate(_listitemCount(products.length), (index) {
      double width = .59 * MediaQuery.of(context).size.width;
      Widget column;

      if (index % 2 == 0) {
        int bottom = _evenCaseIndex(index);
        column = TwoProductCardColumn(
          bottom: products[bottom],
          top: products.length - 1 >= bottom + 1 ? products[bottom + 1] : null,
        );
        width += 32;
      } else {
        column = OneProductCardColumn(
          product: products[_oddCaseIndex(index)],
        );
      }
      return SizedBox(
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: column,
        ),
      );
    }).toList();
  }

  int _listitemCount(int totalIteams) {
    if (totalIteams % 3 == 0) {
      return totalIteams ~/ 3 * 2;
    } else {
      return (totalIteams / 3).ceil() * 2 - 1;
    }
  }

  int _evenCaseIndex(int input) {
    return input ~/ 2 * 3;
  }

  int _oddCaseIndex(int input) {
    assert(input > 0);
    return (input / 2).ceil() * 3 - 1;
  }
}
