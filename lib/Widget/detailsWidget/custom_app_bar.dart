import 'package:flutter/material.dart';

import 'package:kasrzero_flutter/constants.dart';




class CustomAppBar extends StatelessWidget {
  


  @override
  // AppBar().preferredSize.height provide us the height that appy on our app bar
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20),vertical: 6),
        child: Row(
          children:[
            SizedBox(
              height: getProportionateScreenWidth(40),
              width: getProportionateScreenWidth(40),
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  primary: KPrimaryColor,
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.zero,
                ),
                // Navigator.pop(context)
                onPressed: () => {Navigator.pop(context)},
                child: Icon(Icons.arrow_back)
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
