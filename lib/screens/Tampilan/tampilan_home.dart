import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/constants.dart';
import 'package:news/controllers/rounded_button.dart';
import 'package:news/screens/Admin/antrian_screen.dart';

class TampilanHome extends StatefulWidget {
  @override
  State<TampilanHome> createState() => _TampilanHomeState();
}

LOKET? selectedLoket;
List<LOKET> jenisLoket = [
  LOKET("Admin"),
  LOKET("Costumer Service"),
];

DateTime? tanggal;

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

class _TampilanHomeState extends State<TampilanHome> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 400),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/images/Satlantas.png",
              width: 250,
            ),
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
              text: "MASUK",
              press: () {
                Get.to(AntrianScreen());
              },
            ),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }
}

class LOKET {
  String lkt;
  LOKET(this.lkt);
}
