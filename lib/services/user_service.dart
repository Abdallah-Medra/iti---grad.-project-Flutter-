import 'dart:convert';
import 'package:kasrzero_flutter/constants.dart';
import 'package:kasrzero_flutter/models/user_data.dart';
import 'package:kasrzero_flutter/models/user_login.dart';
import 'package:http/http.dart' as http;
import 'package:kasrzero_flutter/models/user_signup.dart';

class UserService {
  Future<UserData> getUser(String email) async {
    Uri url = Uri.http(KLocalhost, "/user/getUser/$email");

    print(url);
    var res = await http.get(url);
    var data = jsonDecode(res.body);
    // var data = r as UserData;
    // print(r['_id']);
    return UserData(
        id: data["_id"],
        userName: data["userName"],
        email: data["email"],
        password: data["password"],
        ads: data["ads"],
        cart: data["cart"],
        orders: data["orders"],
        time: data["time"],
        wishlist: data["wishlist"],
        address: data["address"],
        phoneNumber: data["phoneNumber"]);
    // print(userData);
    // return data;
  }
}
