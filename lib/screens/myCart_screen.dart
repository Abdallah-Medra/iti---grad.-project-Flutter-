// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
    // return Scaffold(
    // body: Container(
    //     color: Colors.grey[200],
    //     width: double.infinity,
    //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    //     child: ListView(
    //       children: [
    //         Container(
    //           padding: EdgeInsets.all(15),
    //           margin: EdgeInsets.symmetric(vertical: 10),
    //           decoration: BoxDecoration(
    //               color: Colors.white,
    //               border: Border.all(color: Colors.white),
    //               borderRadius: BorderRadius.all(Radius.circular(20))),
    //           child: ListView(
    //             children: [
    //               Row(
    //                 children: [
    //                   Text(
    //                     "Iphone 12",
    //                     style:
    //                         TextStyle(fontSize: 24, color: Colors.grey[600]),
    //                   ),
    //                 ],
    //               ),
    //               Row(
    //                 children: [
    //                   Text(
    //                     "256 GB - 8 GB RAM",
    //                     style: TextStyle(fontSize: 14, color: Colors.grey),
    //                   ),
    //                 ],
    //               ),
    //               Row(
    //                 children: [
    //                   Text(
    //                     "Silver",
    //                     style: TextStyle(fontSize: 12, color: Colors.grey),
    //                   ),
    //                 ],
    //               ),
    //               Row(
    //                 children: [
    //                   Text(
    //                     "14,500 EGP",
    //                     style: TextStyle(fontSize: 16, color: Colors.grey),
    //                   ),
    //                 ],
    //               ),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   ElevatedButton(
    //                     onPressed: () {},
    //                     style: ElevatedButton.styleFrom(
    //                         primary: Color.fromARGB(255, 89, 195, 107)),
    //                     child: Text(
    //                       "Exchange",
    //                       style: TextStyle(fontSize: 12),
    //                     ),
    //                   ),
    //                   ElevatedButton(
    //                     onPressed: () {},
    //                     style: ElevatedButton.styleFrom(
    //                         primary: Color.fromARGB(255, 128, 164, 223)),
    //                     child: Text(
    //                       "View Offers",
    //                       style: TextStyle(fontSize: 12),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.end,
    //                 children: [
    //                   ElevatedButton(
    //                     onPressed: () {},
    //                     style: ElevatedButton.styleFrom(primary: Colors.red),
    //                     child: Text(
    //                       "Remove",
    //                       style: TextStyle(fontSize: 12),
    //                     ),
    //                   ),
    //                 ],
    //               )
    //             ],
    //           ),
    //         ),
    //       ],
    //     )),
    // );
  }
}
