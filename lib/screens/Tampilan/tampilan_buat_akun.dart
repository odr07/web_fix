import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/constants.dart';
import 'package:news/controllers/rounded_button.dart';
import 'package:news/screens/Admin/antrian_screen.dart';

class TampilanBuatAkun extends StatefulWidget {
  @override
  State<TampilanBuatAkun> createState() => _TampilanBuatAkunState();
}

LOKET? selectedLoket;
List<LOKET> jenisLoket = [
  LOKET("Admin"),
  LOKET("Costumer Service"),
];

List<DropdownMenuItem> generateItemLoket(List<LOKET> jenisLoket) {
  List<DropdownMenuItem> items = [];
  for (var item in jenisLoket) {
    items.add(DropdownMenuItem(
      child: Text(item.lkt),
      value: item,
    ));
  }
  return items;
}

class _TampilanBuatAkunState extends State<TampilanBuatAkun> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(
            child: Container(
          child: const Center(
            child: Text("UNTUK DATA ANTRIAN"),
          ),
          height: 100,
        )),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: size.height * 0.03),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Username",
                  hintStyle: TextStyle(color: kTextFieldColor),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: true ? _isObscure : false,
                decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(
                      color: kTextFieldColor,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                    ),
                    suffixIcon: true
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                            icon: _isObscure
                                ? Icon(
                                    Icons.visibility_off,
                                    color: kTextFieldColor,
                                  )
                                : Icon(
                                    Icons.visibility,
                                    color: kPrimaryColor,
                                  ),
                          )
                        : null),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(),
                ),
                child: DropdownButton<dynamic>(
                    hint: Text(" -- Masuk Sebagai -- ",
                        style: TextStyle(color: kTextFieldColor)),
                    isExpanded: true,
                    value: selectedLoket,
                    items: generateItemLoket(jenisLoket),
                    onChanged: (item) {
                      setState(() {
                        selectedLoket = item;
                      });
                    }),
              ),
              SizedBox(height: 20),
              RoundedButton(
                text: "BUAT",
                press: () {
                  Get.to(AntrianScreen());
                },
              ),
              SizedBox(height: size.height * 0.03),
            ],
          ),
        ),
      ],
    );
  }
}

class LOKET {
  String lkt;
  LOKET(this.lkt);
}
