import 'package:flutter/material.dart';
import 'package:kasrzero_flutter/constants.dart';
import 'package:kasrzero_flutter/providers/user_provider.dart';
import 'package:kasrzero_flutter/screens/add_credit_screen.dart';
import 'package:kasrzero_flutter/screens/category_screen.dart';
import 'package:kasrzero_flutter/screens/confirm_order.dart';
import 'package:kasrzero_flutter/screens/details_%D9%8Dscreen.dart';
import 'package:kasrzero_flutter/screens/exchange_products_screen.dart';
import 'package:kasrzero_flutter/screens/home_screen.dart';
import 'package:kasrzero_flutter/screens/main_screen.dart';
import 'package:kasrzero_flutter/screens/myAds_screen.dart';
import 'package:kasrzero_flutter/screens/myCart_screen.dart';
import 'package:kasrzero_flutter/screens/myInfo_screen.dart';
import 'package:kasrzero_flutter/screens/myWishlist_screen.dart';
import 'package:kasrzero_flutter/screens/my_account_screen.dart';
import 'package:kasrzero_flutter/screens/on_boarding_screen.dart';
import 'package:kasrzero_flutter/screens/post_ad_screen.dart';
import 'package:kasrzero_flutter/screens/product_screen.dart';
import 'package:kasrzero_flutter/screens/signin_screen.dart';
import 'package:kasrzero_flutter/screens/signup_screen.dart';
// import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        )
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: ((context, child) => MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: ThemeData(
                  primarySwatch: Palette.kToDark,
                  canvasColor: Color.fromARGB(255, 247, 247, 247),
                ),
                initialRoute: "/",
                routes: {
                  // "/": (context) => OnBoardingScreen(),
                  "/": (context) => MainScreen(),
                  "/main": (context) => MainScreen(),
                  "/home": (context) => HomeScreen(),
                  "/exchange_products": (context) => ExchangeProductsScreen(),
                  "/my_ads": (context) => const MyAdsScreen(),
                  "/my_info": (context) => const MyInfoScreen(),
                  "/my_account": (context) => const MyAccountScreen(),
                  "/my_wishlist": (context) => const MyWishlistScreen(),
                  "/my_cart": (context) => const MyCartScreen(),
                  "/on_boarding": (context) => const OnBoardingScreen(),
                  "/post_ad": (context) => const PostAdScreen(),
                  "/product": (context) => DetailsScreen(),
                  "/signin": (context) => const SignInScreen(),
                  "/signup": (context) => const SignUpScreen(),
                  "/confirm_order": (context) => const ConfirmOrder(),
                  "/add_credit_card": (context) => AddCreditScreen(),
                })),
      ),
    );
    // ));
  }
}
