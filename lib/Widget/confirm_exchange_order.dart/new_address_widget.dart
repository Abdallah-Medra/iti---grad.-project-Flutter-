import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kasrzero_flutter/constants.dart';

class NewAddressModal extends StatefulWidget {
  NewAddressModal({super.key});

  @override
  State<NewAddressModal> createState() => _NewAddressModalState();
}

class _NewAddressModalState extends State<NewAddressModal> {
  final address = {"blockNumber": 0, "st": "", "area": "", "city": ""};

  final _addressFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Center(
        child: Form(
          key: _addressFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Center(child: Text("New Address")),
              TextFormField(
                cursorColor: KPrimaryColor,
                decoration: InputDecoration(
                  label: const Text("Block number",
                      style: TextStyle(color: KPrimaryColor)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: KPrimaryColor),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  address['blockNumber'] = value;
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
                  label: const Text("Street name",
                      style: TextStyle(color: KPrimaryColor)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: KPrimaryColor),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  address['st'] = value;
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
                  label: const Text("Area",
                      style: TextStyle(color: KPrimaryColor)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: KPrimaryColor),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  address['area'] = value;
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
                  label: const Text("City",
                      style: TextStyle(color: KPrimaryColor)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: KPrimaryColor),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  address['city'] = value;
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
              ElevatedButton(
                  child: const Text('Add address'),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(KPrimaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (_addressFormKey.currentState!.validate()) {
                      _addressFormKey.currentState!.save();
                      print(
                          "${address['blockNumber']} ${address['st']}, ${address['area']}, ${address['city']}");
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
