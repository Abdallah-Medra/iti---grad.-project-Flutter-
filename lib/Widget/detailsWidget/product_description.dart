import 'package:flutter/material.dart';
import 'package:kasrzero_flutter/constants.dart';
import 'package:kasrzero_flutter/models/category.dart';
import 'package:kasrzero_flutter/models/product.dart';
import 'package:kasrzero_flutter/services/store.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({
    Key? key,
    required this.product,
    this.pressOnSeeMore,
  }) : super(key: key);

  final Product product;
  final GestureTapCallback? pressOnSeeMore;

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  Category category = Category(
    id: "",
    title: "",
    brands: [],
    titlefirstFilter: "",
    titlesecondFilter: "",
    titlethirdFilter: "",
    optionsfirstFilter: [],
    optionssecondFilter: [],
    optionsthirdFilter: [],
  );
  final apiCategory = CategoryApi();
 
  @override
  void initState() {
    getCategories();
    super.initState();
  }

  getCategories() async {
    await apiCategory.getcatbyid(widget.product.categoryId);
    // setState(() {
    //   category = cat;
    // });
  }


  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            widget.product.title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: 10,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "brand :",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: KPrimaryColor),
                  ),
                  SizedBox(width: 10),
                  Text(
                    widget.product.brand,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10),
              Row(
                children: [
                  Text(
                    category.titlefirstFilter + ":",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: KPrimaryColor),
                  ),
                  SizedBox(width: 10),
                  Text(
                    widget.product.firstFilter,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "duration Of Use:",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: KPrimaryColor),
                  ),
                  SizedBox(width: 10),
                  Text(
                    widget.product.durationOfUse,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10),
              Row(
                children: [
                  Text(
                    category.titlesecondFilter + ":",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: KPrimaryColor),
                  ),
                  SizedBox(width: 10),
                  Text(
                    widget.product.secondFilter,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Color:",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: KPrimaryColor),
                  ),
                  SizedBox(width: 10),
                  Text(
                    widget.product.color,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 20),
              Row(
                children: [
                  Text(
                    category.titlethirdFilter + ":",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: KPrimaryColor),
                  ),
                  SizedBox(width: 10),
                  Text(
                    widget.product.thirdFilter,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenHeight(10),
          ),
          child: Text(
            widget.product.description,
            maxLines: 3,
          ),
        ),
      ],
    );
  }
}
