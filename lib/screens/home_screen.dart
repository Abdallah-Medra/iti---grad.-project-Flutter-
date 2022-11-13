import 'package:flutter/material.dart';
import 'package:kasrzero_flutter/Widget/card_widget.dart';
import 'package:kasrzero_flutter/Widget/detailsWidget/top_rounded_container.dart';
import 'package:kasrzero_flutter/constants.dart';
import 'package:kasrzero_flutter/models/category.dart';
import 'package:kasrzero_flutter/models/product.dart';
import 'package:kasrzero_flutter/services/store.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var ApiCategory = CategoryApi();
  var Apiproduct = ProductApi();
  List<Category> cat = [];
  List<Product> pro = [];
  List<Product> catpro = [];
  List<Product> pro1 = [];
  @override
  void initState() {
    ApiCategory.getcat().then((value) {
      setState(() {
        cat = value;
      });
    });
    Apiproduct.getpro().then((value) => {
          setState(() {
            pro = value;
            pro1 = value;
          }),
          pro = pro1,
          print(value[0].id)
        });
  }

  void getcatpro(String id) {
    catpro = pro1.where((element) => element.categoryId == id).toList();
    print(catpro);
    setState(() {
      pro = catpro;
    });
  }

  var x;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 290,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: TextField(
                      onChanged: (value) => print(value),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintText: "Search product",
                          prefixIcon: Icon(Icons.search)),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(100),
                    child: Stack(clipBehavior: Clip.none, children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        height: 46,
                        width: 46,
                        decoration: const BoxDecoration(
                          color: KPrimaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.filter_list),
                      ),
                    ]),
                    onTap: () => {
                      showModalBottomSheet<void>(
                        backgroundColor: Color.fromARGB(0, 255, 255, 255),
                        context: context,
                        builder: (BuildContext context) {
                          return TopRoundedContainer(
                            color: Color.fromARGB(144, 252, 172, 69),
                            child: Container(
                              height: 1000,
                            ),
                          );
                        },
                      )
                    },
                  )
                ],
              ),
            ),
            Expanded(
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: cat
                        .map((e) => InkWell(
                            onTap: () => {getcatpro(e.id)},
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Chip(
                                label: Text(e.title),
                                backgroundColor: Colors.white,
                                labelStyle: TextStyle(color: Colors.grey),
                              ),
                            )))
                        .toList())),
            Expanded(
                flex: 7,
                child: FurnitureListView(
                  ProductList: pro,
                  isHorizontal: false,
                  onTap: (Product) {
                    print(Product.title);
                    Navigator.of(context)
                        .pushNamed("/product", arguments: Product);
                  },
                ))
          ],
        ),
      ),
    );
  }
}
