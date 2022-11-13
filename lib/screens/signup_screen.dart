import 'package:flutter/material.dart';
import 'package:kasrzero_flutter/constants.dart';
import 'package:kasrzero_flutter/models/user_signup.dart';
import 'package:kasrzero_flutter/services/auth.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../models/user_data.dart';
import '../providers/user_provider.dart';
import '../services/user_service.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String confirm = "";
  final user =
      UserSignup(email: "", password: "", phoneNumber: "", userName: "");
  var userAuth = Auth();
  var userService = UserService();
  bool isLoading = false;

  Signup(ctx) {
    if (_formKey.currentState!.validate()) {
      if (user.password == confirm) {
        setState(() {
          isLoading = true;
        });
        _formKey.currentState?.save();

        userAuth.Signup(user).then((value) async {
          setState(() {
            isLoading = false;
          });
          if (value.body == "failed") {
            ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
                content: Text("Please enter correct information")));
          } else {
            UserData currentUser = await userService.getUser(user.email);
            print(currentUser.email);
            Provider.of<UserProvider>(ctx, listen: false).setUser(currentUser);
            Navigator.pop(ctx);
          }
        }).catchError((err) {
          setState(() {
            isLoading = false;
          });
          print("error");
        });
      } else {
        ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
            content: Text("Confirm password should be same as password")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: KPrimaryColor,
            toolbarHeight: 50.h,
            title: Text("Register Form"),
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          body: isLoading
              ? Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                    color: KPrimaryColor,
                    size: 30,
                  ),
                )
              : Form(
                  key: _formKey,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                    child: ListView(
                      children: [
                        Container(
                            color: Colors.white,
                            height: 150.h,
                            width: double.infinity,
                            child: Image.asset('images/signup.png')),
                        TextFormField(
                          cursorColor: KPrimaryColor,
                          decoration: InputDecoration(
                            label: Text(
                              "User Name",
                              style: TextStyle(color: KPrimaryColor),
                            ),
                            prefixIcon: Icon(
                              Icons.person,
                              color: KPrimaryColor,
                            ),
                            contentPadding: EdgeInsets.all(0),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(color: KPrimaryColor),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          onChanged: (value) {
                            user.userName = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "This field is required";
                            }
                          },
                        ),
                        SizedBox(
                          height: 13.h,
                        ),
                        TextFormField(
                          cursorColor: KPrimaryColor,
                          decoration: InputDecoration(
                            label: Text(
                              "Phone Number",
                              style: TextStyle(color: KPrimaryColor),
                            ),
                            prefixIcon: Icon(
                              Icons.phone,
                              color: KPrimaryColor,
                            ),
                            contentPadding: EdgeInsets.all(0),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(color: KPrimaryColor),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          // obscureText: true,
                          onChanged: (value) {
                            user.phoneNumber = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "This field is required";
                            }
                          },
                        ),
                        SizedBox(
                          height: 13.h,
                        ),
                        TextFormField(
                          cursorColor: KPrimaryColor,
                          decoration: InputDecoration(
                            label: Text(
                              "Email",
                              style: TextStyle(color: KPrimaryColor),
                            ),
                            prefixIcon: Icon(
                              Icons.email,
                              color: KPrimaryColor,
                            ),
                            contentPadding: EdgeInsets.all(0),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(color: KPrimaryColor),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            user.email = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "This field is required";
                            }
                          },
                        ),
                        SizedBox(
                          height: 13.h,
                        ),
                        TextFormField(
                          cursorColor: KPrimaryColor,
                          decoration: InputDecoration(
                            label: Text(
                              "Password",
                              style: TextStyle(color: KPrimaryColor),
                            ),
                            prefixIcon: Icon(
                              Icons.password,
                              color: KPrimaryColor,
                            ),
                            contentPadding: EdgeInsets.all(0),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(color: KPrimaryColor),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          onChanged: (value) {
                            user.password = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "This field is required";
                            }
                          },
                        ),
                        SizedBox(
                          height: 13.h,
                        ),
                        TextFormField(
                          cursorColor: KPrimaryColor,
                          decoration: InputDecoration(
                            label: Text(
                              "Confirm Password",
                              style: TextStyle(color: KPrimaryColor),
                            ),
                            prefixIcon: Icon(
                              Icons.password,
                              color: KPrimaryColor,
                            ),
                            contentPadding: EdgeInsets.all(0),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(color: KPrimaryColor),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          onChanged: (value) {
                            confirm = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "This field is required";
                            }
                          },
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 251, 176, 59))),
                          onPressed: () {
                            setState(() {
                              Signup(context);
                            });
                          },
                          child: Text("Sign up",
                              style: TextStyle(fontSize: 17.sp)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'I have an account ',
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w600),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushReplacementNamed('/signin');
                              },
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                    color: KPrimaryColor,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ))),
    );
  }
}
