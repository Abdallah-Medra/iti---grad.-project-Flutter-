// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:kasrzero_flutter/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../dummy_data.dart';
import '../models/product.dart';

class MyWishlistScreen extends StatefulWidget {
  const MyWishlistScreen({super.key});

  @override
  State<MyWishlistScreen> createState() => _MyWishlistScreenState();
}

class _MyWishlistScreenState extends State<MyWishlistScreen> {
  TextEditingController wish = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final currentUser = userProvider.getUser();
    var userId = Provider.of<UserProvider>(context, listen: false).user.id;

    Future<List<String>> getData() async {
      Uri url = Uri.http(KLocalhost, "/user/wishlist/$userId");

      print(url);
      try {
        var response = await http.get(url);
        List<String> wishlistFromJson(String str) =>
            List<String>.from(json.decode(str).map((x) => x));

        print(userId);
        var x = wishlistFromJson(response.body);
        print(x);
        return x;
      } catch (e) {
        print(e);
        return [];
      }
    }

    Future addToWishlist() async {
      Uri url = Uri.http(KLocalhost, "/user/wishlist/$userId");
      try {
        print(url);
        // make post req to backend, with the item to be added
        await http.post(url,
            body: jsonEncode({"title": wish.text}),
            headers: {"Content-Type": "application/json"});
        // add item to the list
        setState(() {});
        // clear user input
        wish.clear();
      } catch (e) {
        // in case of error, send a message with the error

      }
    }

    Future<void> removeItemFromWishList(String item) async {
      Uri url = Uri.http(KLocalhost, "/user/wishlist/$userId");

      await http.delete(url,
          body: jsonEncode({"title": item}),
          headers: {"Content-Type": "application/json"});
      // add item to the list
      setState(() {});
    }

    return Scaffold(
        appBar: AppBar(
            backgroundColor: KPrimaryColor,
            centerTitle: true,
            title: Text("Wishlist"),
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back),
            )),
        body: currentUser.id != "id"
            ? Column(
                children: [
                  TextFormField(
                    controller: wish,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.favorite),
                        hintText: "Item Name"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            addToWishlist();
                          },
                          child: Text("Add"))
                    ],
                  ),
                  Expanded(
                    child: FutureBuilder(
                        initialData: [],
                        future: getData(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                                child:
                                    const CircularProgressIndicator.adaptive());
                          }
                          if (snapshot.hasError) {
                            return Text(snapshot.error.toString());
                          } else {
                            if (snapshot.data!.isEmpty) {
                              return Center(
                                  child: Text('Your wishlist is empty!'));
                            }
                            return RefreshIndicator(
                              onRefresh: () async {
                                await getData();
                                setState(() {});
                              },
                              child: ListView.builder(
                                itemCount: snapshot.data?.length,
                                itemBuilder: (context, index) {
                                  var item = snapshot.data![index];
                                  return Container(
                                    padding: EdgeInsets.all(15),
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: Colors.white),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "$item",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.grey[600]),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                removeItemFromWishList(item);
                                              },
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
                              ),
                            );
                          }
                        }),
                  ),
                ],
              )
            : Center(
                child: ElevatedButton(
                child: Text("Login"),
                onPressed: () {
                  Navigator.pushNamed(context, '/signin');
                },
              )));
  }
}
