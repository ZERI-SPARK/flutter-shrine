import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shrine/model/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.imageAspectRatio = 33.0 / 49.0,
    required this.product,
  })  : assert(imageAspectRatio > 0),
        super(key: key);

  final double imageAspectRatio;
  final Product product;

  static const kTextBoxHeight = 65.0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
      locale: Localizations.localeOf(context).toString(),
    );
    final imageWidget = Image.asset(
      product.assetName,
      package: product.assetPackage,
      fit: BoxFit.fitWidth,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,

      children: <Widget>[
        AspectRatio(aspectRatio: imageAspectRatio,
         child: imageWidget,
         ),
         SizedBox(
           height:  kTextBoxHeight * MediaQuery.of(context).textScaleFactor,
           width: 121.0,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.end,
             children: <Widget>[
               Text(
                      product.name,
                      style: theme.textTheme.headline6,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(
                     height: 4.0
                     ),
                    Text(
                      formatter.format(product.price),
                      style: theme.textTheme.subtitle2,
                    ),
             ],
           ),
           
         )
      ],
    );
  }
}
