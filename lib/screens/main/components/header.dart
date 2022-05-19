import 'package:flutter/material.dart';

import '../../../constants.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: kDarkBlackColor,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: kMaxWidth),
              padding: EdgeInsets.all(kDefaultPadding),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/Logo.png",
                        width: 100,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "|",
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                      SizedBox(width: 10),
                      Text(
                        " Sistem informasi Atrian Pembuatan SIM",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
