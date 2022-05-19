import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/controllers/MenuController.dart';
import 'package:news/responsive.dart';
import 'package:news/screens/Admin/components/web_menu.dart';

import '../../../../../constants.dart';

class HeaderAdmin extends StatelessWidget {
  final MenuController _controller = Get.put(MenuController());

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
                      if (!Responsive.isDesktop(context))
                        IconButton(
                          icon: Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            _controller.openOrCloseDrawer();
                          },
                        ),
                      Image.asset(
                        "assets/images/Logo.png",
                        width: 100,
                      ),
                      Spacer(),
                      if (Responsive.isDesktop(context)) WebMenu(),
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
