import 'package:flutter/cupertino.dart';
//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import  'package:intl/intl.dart';
import 'package:kasrzero_flutter/constants.dart';
// import 'package:flutter/cupertino';
//import 'package:intl/date_symbol_data_local.dart';

enum GenderEnum{ Female , Male}
 GenderEnum?_genderEnum;

// class MyInfoScreen extends StatelessWidget {
//   TextEditingController dateController=TextEditingController();


  // const MyInfoScreen({super.key});
  // const MyInfoScreen({
  //   Key? key,
  //
  //
  // }):super(key: key);


  class MyInfoScreen extends StatefulWidget {

    const MyInfoScreen({Key? key}) : super(key: key);

    @override
    State<MyInfoScreen> createState() => _MyInfoScreenState();
  }

  class _MyInfoScreenState extends State<MyInfoScreen> {
    DateTime dataTime =DateTime(2000,2,1,10,20);

    DateTime? _showdate;
    TextEditingController _date = TextEditingController();
    @override
    Widget build(BuildContext context) {
      // return Container();
      return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 1,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: KPrimaryColor),
              onPressed: () => {},
            ),
            actions: [
            ]
        ),
        body: ListView(
          padding: EdgeInsets.only(left: 16,top: 25,right: 16),
          physics: BouncingScrollPhysics(),
          children: [
            Text(
              "Edit Profile",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 66,
            ),
            buildTextField( "Full Name" , "",true),
            buildTextField( "E-mail" , "",true),
            buildTextField( "Address " , "",false),
            buildTextField( "Phone Number " , "" ,false ),
            TextField(
              controller: _date,
              decoration: const InputDecoration(
                  labelText: "Birth Date",
                suffixIcon: Icon(Icons.calendar_today),
              ),
              readOnly: true,
              onTap: ()async{
                DateTime? pickeddate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1700), lastDate: DateTime(2102));
                if(pickeddate !=null)
                  {
                    setState(() {
                      _date.text = DateFormat('dd-MM-yyyy').format(pickeddate);
                    });
                  }
              },),
            TextField(
              readOnly:true,
              decoration: const InputDecoration(
              labelText: "gender",),
            ),
            Row(
              children: [
            Expanded(
              child: RadioListTile<GenderEnum>(
                contentPadding: EdgeInsets.all(0.0),
                  shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  ),
                  value: GenderEnum.Female,
                  groupValue: _genderEnum,
                  dense: true,
                  tileColor: KPrimaryColor,
                  title: Text(GenderEnum.Female.name),
                  onChanged: (val){
                    setState(() {
                      _genderEnum =val;
                    });
                  }),
            ),
            SizedBox(width: 5.0),
            Expanded(
              child: RadioListTile<GenderEnum>(
                  contentPadding: EdgeInsets.all(0.0),
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  ) ,
                  value: GenderEnum.Male,
                  groupValue: _genderEnum,
                  dense: true,
                  tileColor: KPrimaryColor,
                  title: Text(GenderEnum.Male.name),
                  onChanged: (val){
                    setState(() {
                      _genderEnum =val;
                    });
                  }),
            ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                    onPressed: ()=>{},
                    child: Text("Cancel",
                      style: TextStyle(fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.black),)
                ),
                OutlinedButton(
                    onPressed: () => {},
                    child: Text("Save",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.black
                      ),)
                ),
              ],
            )
      ],
        ),
      );
    }
  }

  Widget buildTextField(String labelText,String placehoder , bool readOnly) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child:TextField(
        readOnly: readOnly,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placehoder,
          hintStyle: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      )
    );
  }

