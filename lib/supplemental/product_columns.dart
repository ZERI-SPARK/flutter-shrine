import 'package:flutter/material.dart';
import 'package:shrine/model/product.dart';
import 'product_card.dart';

class TwoProductCardColumn extends StatelessWidget {
  final Product? top;
  final Product bottom;

  const TwoProductCardColumn({Key? key, this.top, required this.bottom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const SpaceHeight = 44.0;

        double heightOfCards = (constraints.biggest.height - SpaceHeight) / 2.0;
        double heightOfImages = heightOfCards - ProductCard.kTextBoxHeight;

        double imageAspectRatio = heightOfImages >= 0.0 ? constraints.biggest.width / heightOfImages :49.0 / 33.0;
        // TODO: Change imageAspectRatio calculation (104)

        
        // TODO: Replace Column with a ListView (104)

        return ListView(
         physics: const ClampingScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 28.0),
              child: top != null
                  ? ProductCard(
                      product: top!,
                      imageAspectRatio: imageAspectRatio,
                    )
                  : SizedBox(
                      height: heightOfCards,
                    ),
            ),
            const SizedBox(
              height: 44.0,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 28.0),
              child: ProductCard(
                product: bottom,
                imageAspectRatio: imageAspectRatio,
              ),
            ),
          ],
        );
      },
    );
  }
}

class OneProductCardColumn extends StatelessWidget {
  final Product product;
  const OneProductCardColumn({Key? key, required this.product,})
   : super(key: key);

  @override
  Widget build(BuildContext context) {
     
    return ListView(
        physics: const ClampingScrollPhysics(),
        reverse: true,
        children: <Widget>[
          
          const  SizedBox(
            height: 40.0,
          ),
          ProductCard(
            product: product,
            ),
        ],
     
    );
  }
}
