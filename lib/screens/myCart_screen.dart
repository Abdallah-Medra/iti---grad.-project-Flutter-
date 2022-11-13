// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../constants.dart';
import '../models/product.dart';
import '../providers/user_provider.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final currentUser = userProvider.getUser();
    var userId = Provider.of<UserProvider>(context, listen: false).user.id;

    Future<List<Product>> getData() async {
      Uri url = Uri.http(KLocalhost, "/user/ads/$userId");

      print(url);
      try {
        var response = await http.get(url);
        var responseBody = jsonDecode(response.body) as List;
        List<Product> cartList =
            responseBody.map((p) => Product.fromJson(p)).toList();
        print(userId);
        return cartList;
      } catch (e) {
        print(e);
        return [];
      }
    }

    return Scaffold(
      appBar: AppBar(
          backgroundColor: KPrimaryColor,
          centerTitle: true,
          title: Text("My Cart"),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back),
          )),
      body: currentUser.id != "id"
          ? Container(
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
                        return Center(child: Text('Your wishlist is empty!'));
                      }
                      return ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            var item = snapshot.data![index];
                            return Container();
                          });
                    }
                  }),
            )
          : Center(
              child: ElevatedButton(
              child: Text("Login"),
              onPressed: () {
                Navigator.pushNamed(context, '/signin');
              },
            )),
    );
  }
}
