import 'package:flutter/material.dart';
import 'package:news/screens/Tampilan/tampilan_home.dart';
import 'package:news/screens/main/components/header.dart';

import '../../constants.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            Container(
              padding: EdgeInsets.all(kDefaultPadding),
              constraints: BoxConstraints(maxWidth: kMaxWidth),
              child: SafeArea(child: TampilanHome()),
            ),
          ],
        ),
      ),
    );
  }
}
