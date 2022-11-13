// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../constants.dart';
import '../dummy_data.dart';
import '../models/product.dart';
import '../providers/user_provider.dart';

class MyAdsScreen extends StatefulWidget {
  const MyAdsScreen({super.key});

  @override
  State<MyAdsScreen> createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen> {
  List<Product> products = [];

  @override
  Widget build(BuildContext context) {
    var userId = Provider.of<UserProvider>(context, listen: false).user.id;

    Future<List<Product>> getData() async {
      Uri url = Uri.http(KLocalhost, "/user/ads/$userId");

      print(url);
      try {
        // await Future.delayed(const Duration(seconds: 10));
        var response = await http.get(url);
        var responseBody = jsonDecode(response.body) as List;
        List<Product> actualProducts =
            responseBody.map((p) => Product.fromJson(p)).toList();
        print(userId);
        return actualProducts;
      } catch (e) {
        print(e);
        return [];
      }
    }

    return Scaffold(
        appBar: AppBar(
            backgroundColor: KPrimaryColor,
            centerTitle: true,
            title: Text("My Ads."),
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back),
            )),
        body: Container(
            // color: Colors.grey[900],
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: FutureBuilder(
                initialData: [],
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: const CircularProgressIndicator.adaptive());
                  }
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    if (snapshot.data!.isEmpty) {
                      return Center(child: Text('You have no ads. yet'));
                    }
                    return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        var item = Dummy_products[index];
                        return Container(
                          padding: EdgeInsets.all(15),
                          margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    item.title,
                                    style: TextStyle(
                                        fontSize: 24, color: Colors.grey[600]),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    item.description,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    item.color,
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${item.price}EGP",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromARGB(255, 89, 195, 107)),
                                    child: Text(
                                      "Exchange",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromARGB(255, 128, 164, 223)),
                                    child: Text(
                                      "View Offers",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.red),
                                    child: Text(
                                      "Remove",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    );
                  }
                })));
  }
}
