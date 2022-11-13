import 'package:flutter/material.dart';
import 'package:kasrzero_flutter/Widget/detailsWidget/default_button.dart';
import 'package:kasrzero_flutter/constants.dart';
import 'package:kasrzero_flutter/models/product.dart';

import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductImages(product: product),
        Expanded(
          child: TopRoundedContainer(
            color: Colors.white,
            child: ProductDescription(
              product: product,
              pressOnSeeMore: () {},
            ),
          ),
        ),
        TopRoundedContainer(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: SizeConfig.screenWidth * 0.15,
                    right: SizeConfig.screenWidth * 0.15,
                    bottom: getProportionateScreenWidth(30),
                    top: getProportionateScreenWidth(4),
                  ),
                  child: Column(
                    children: [
                  DefaultButton(
                    text: "Add To Cart",
                    press: () {},
                  ),
                  (product.ableToExchange=="true"?DefaultButton(
                    text: "Exchange",
                    press: () {
                      // Navigator.of(context)
                      //   .pushNamed("/", arguments: Product);
                    },
                  ):Container()),
                    ],
                  )
                ),
              ),
      ],
    );
  }
}
