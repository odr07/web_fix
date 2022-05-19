import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/constants.dart';
import 'package:news/screens/Tampilan/tampilan_cs.dart';

class TampilanAntrianAdmin extends StatefulWidget {
  const TampilanAntrianAdmin({Key? key}) : super(key: key);

  @override
  State<TampilanAntrianAdmin> createState() => _TampilanAntrianAdminState();
}

class _TampilanAntrianAdminState extends State<TampilanAntrianAdmin> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        spacing: 50,
        runSpacing: 80,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 10,
              ),
              Text("LOKET R1"),
              SizedBox(
                height: 10,
              ),
              field_antrian(
                colors: kPrimaryColor,
                title: "A001",
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text("LOKET R2"),
              SizedBox(
                height: 10,
              ),
              field_antrian(
                colors: kPrimaryColor,
                title: "A001",
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text("LOKET F1"),
              SizedBox(
                height: 10,
              ),
              field_antrian(
                colors: kPrimaryColor,
                title: "A001",
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text("LOKET F2"),
              SizedBox(
                height: 10,
              ),
              field_antrian(
                colors: kPrimaryColor,
                title: "A001",
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text("UJIAN SIMULATOR"),
              SizedBox(
                height: 10,
              ),
              field_antrian(
                colors: kPrimaryColor,
                title: "A001",
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text("UJIAN TEORI "),
              SizedBox(
                height: 10,
              ),
              field_antrian(
                colors: kPrimaryColor,
                title: "A001",
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text("UJIAN PRAKTEK"),
              SizedBox(
                height: 10,
              ),
              field_antrian(
                colors: kPrimaryColor,
                title: "A001",
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text("PEMBAYARAN"),
              SizedBox(
                height: 10,
              ),
              field_antrian(
                colors: kPrimaryColor,
                title: "A001",
              ),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Get.to(TampilanCostumeService());
              },
              child: Text("ISTIRAHAT"),
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow[800],
              ),
            ),
            SizedBox(
              width: 17,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("BERHENTI"),
              style: ElevatedButton.styleFrom(
                primary: Colors.red[800],
              ),
            ),
          ]),
        ],
      ),
    );
  }
}

class field_antrian extends StatelessWidget {
  final String title;
  final Color colors;
  const field_antrian({
    Key? key,
    required this.title,
    required this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        width: 250,
        height: 150,
        decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(17),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
