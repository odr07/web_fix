import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/controllers/MenuController.dart';
import 'package:news/screens/Admin/components/header.dart';
import 'package:news/screens/Tampilan/tampilan_cs.dart';

import '../../constants.dart';
import '../main/components/side_menu.dart';

class RincAntrianScreen extends StatelessWidget {
  final MenuController _controller = Get.put(MenuController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _controller.scaffoldkey,
      drawer: SideMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderAdmin(),
            Container(
              padding: EdgeInsets.all(kDefaultPadding),
              constraints: BoxConstraints(maxWidth: kMaxWidth),
              child: TampilanCostumeService(),
            ),
          ],
        ),
      ),
    );
  }
}
