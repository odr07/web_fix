import 'package:flutter/material.dart';
import 'package:news/constants.dart';

class TampilanCostumeService extends StatefulWidget {
  const TampilanCostumeService({Key? key}) : super(key: key);

  @override
  State<TampilanCostumeService> createState() => _TampilanCostumeServiceState();
}

class _TampilanCostumeServiceState extends State<TampilanCostumeService> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          child: const Center(
            child: Text("UNTUK DATA ANTRIAN"),
          ),
          height: 100,
        )),
        Container(
          width: 400,
          child: Expanded(
            child: Wrap(
              spacing: 10,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text("NOMOR REGIS"),
                    SizedBox(
                      height: 10,
                    ),
                    field_antrian(
                      colors: kPrimaryColor,
                      title: "A001",
                    ),
                    SizedBox(
                      height: 17,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text("NAMA"),
                    SizedBox(
                      height: 10,
                    ),
                    field_antrian(
                      colors: kPrimaryColor,
                      title: "A001",
                    ),
                    SizedBox(
                      height: 17,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text("ANTRIAN"),
                    SizedBox(
                      height: 10,
                    ),
                    field_antrian(
                      colors: kPrimaryColor,
                      title: "A001",
                    ),
                    SizedBox(
                      height: 17,
                    ),
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("STOP"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.yellow[800],
                        ),
                      ),
                      SizedBox(
                        width: 17,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("SKIP"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red[800],
                        ),
                      ),
                      SizedBox(
                        width: 17,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("LANJUT"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green[800],
                        ),
                      ),
                    ]),
              ],
            ),
          ),
        ),
      ],
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
        width: 180,
        height: 120,
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
