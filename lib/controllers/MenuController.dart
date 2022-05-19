import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:news/screens/Admin/akun_screen.dart';
import 'package:news/screens/Admin/antrian_screen.dart';
import 'package:news/screens/Admin/pendaftaran_screen.dart';
import 'package:news/screens/Admin/rincian_antrian_screen.dart';
import 'package:news/screens/Tampilan/tampilan_buat_akun.dart';

class MenuController extends GetxController {
  RxInt _selectedIndex = 0.obs;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int get selectedIndex => _selectedIndex.value;
  List<String> get menuItems =>
      ["Antrian", "Pendaftaran", "Data Antrian", "Akun"];
  GlobalKey<ScaffoldState> get scaffoldkey => _scaffoldKey;

  void openOrCloseDrawer() {
    if (_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openEndDrawer();
    } else {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  void setMenuIndex(BuildContext context, int index) {
    _selectedIndex.value = index;
    switch (index) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => AntrianScreen()));
        break;
      case 1:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => PendaftaranScreen()));
        break;
      case 2:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => RincAntrianScreen()));
        break;
      case 3:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => AkunScreen()));
        break;
    }
  }
}
