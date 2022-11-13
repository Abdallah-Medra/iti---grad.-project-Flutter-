import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kasrzero_flutter/constants.dart';
import 'package:kasrzero_flutter/functions.dart';
import 'package:kasrzero_flutter/models/category.dart';
import 'package:kasrzero_flutter/models/product.dart';

class CategoryApi {
  Future<List<Category>> getcat() async {
    Uri url = Uri.http(KLocalhost, "/product/categories");

    var resp = await http.get(url);
    List<dynamic> data = jsonDecode(resp.body);

    return data
        .map((e) => Category(
              id: e["_id"],
              title: e["title"],
              brands: e["brands"],
              titlefirstFilter: e["firstFilter"]["title"],
              titlesecondFilter: e["secondFilter"]["title"],
              titlethirdFilter: e["thirdFilter"]["title"],
              optionsfirstFilter: e["thirdFilter"]["options"],
              optionssecondFilter: e["thirdFilter"]["options"],
              optionsthirdFilter: e["thirdFilter"]["options"],
            ))
        .toList();
  }

  getcatbyid(String id) async {
    Uri url = Uri.http("192.168.1.9:4000", "/product/categories/$id");
    var resp = await http.get(url);
    // print("in func ${resp}");
    var data = jsonDecode(resp.body);
    print(data);
    // var cat = data as Category;
    // print(cat);
    // Category c = Category(
    //   id: data["_id"],
    //   title: data["title"],
    //   brands: data["brands"],
    //   titlefirstFilter: data["firstFilter"]["title"],
    //   titlesecondFilter: data["secondFilter"]["title"],
    //   titlethirdFilter: data["thirdFilter"]["title"],
    //   optionsfirstFilter: data["firstFilter"]["options"],
    //   optionssecondFilter: data["secondFilter"]["options"],
    //   optionsthirdFilter: data["thirdFilter"]["options"],
    // );

    // print(c);
    // return c;
  }
}

class ProductApi {
  Future<List<Product>> getpro() async {
    Uri url = Uri.http(KLocalhost, "/product/products");

    var resp = await http.get(url);
    var data = jsonDecode(resp.body);
    var list = data as List;
    return list.map((e) => Product.fromJson(e)).toList();
  }

  Future<List<Product>> getOffers(String productId) async {
    Uri url = Uri.http(KLocalhost, "/product/offers/$productId");
    var res = await http.get(url);
    var data = jsonDecode(res.body);
    var recievedProducts = data as List;
    List<Product> products = [];
    for (int i = 0; i < recievedProducts.length; i++) {
      Product p = Product.fromJson(recievedProducts[i]);
      products.add(p);
      // print(p.title);
    }
    return products;
    // print(p);
  }
}
