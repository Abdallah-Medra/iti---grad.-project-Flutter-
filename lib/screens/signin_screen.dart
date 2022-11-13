import 'package:flutter/material.dart';
import 'package:kasrzero_flutter/constants.dart';
import 'package:kasrzero_flutter/models/user_data.dart';
import 'package:kasrzero_flutter/models/user_login.dart';
import 'package:kasrzero_flutter/providers/user_provider.dart';
import 'package:kasrzero_flutter/services/auth.dart';
import 'package:kasrzero_flutter/services/user_service.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final user = UserLogin(email: "", password: "");
  var userAuth = Auth();
  var userService = UserService();
  bool isLoading = false;

  Login(BuildContext ctx) {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      _formKey.currentState?.save();
      // print("in login form func");
      userAuth.Login(user).then((value) async {
        setState(() {
          isLoading = false;
        });
        // print(value.body);
        if (value.body == "failed") {
          ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
              content: Text("Please enter correct information")));
        } else {
          // print(value.body);
          UserData currentUser = await userService.getUser(user.email);
          print(currentUser);
          print(currentUser);

          Provider.of<UserProvider>(ctx, listen: false).setUser(currentUser);
          Navigator.pop(ctx);
        }

        // print(value.body);
        // Navigator.pushReplacementNamed(context, "/home");
        // print(value.headers);
      }).catchError((err) => print(err));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: KPrimaryColor,
            toolbarHeight: 50.h,
            title: Text("Login Form"),
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
                            // height: 100,
                            width: double.infinity,
                            child: Image.asset('images/signinn.png')),
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
                            label: Text("Password",
                                style: TextStyle(color: KPrimaryColor)),
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
                          height: 18.h,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 251, 176, 59))),
                          onPressed: () {
                            setState(() {
                              Login(context);
                            });
                          },
                          child:
                              Text("Login", style: TextStyle(fontSize: 17.sp)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Don\'t have an account? ',
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w600),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushReplacementNamed('/signup');
                              },
                              child: Text(
                                'Sign Up',
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
