import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/controllers/MenuController.dart';

import '../../constants.dart';

class PendaftaranScreen extends StatefulWidget {
  const PendaftaranScreen({Key? key}) : super(key: key);

  @override
  State<PendaftaranScreen> createState() => _PendaftaranScreenState();
}

class _PendaftaranScreenState extends State<PendaftaranScreen> {
  final MenuController _controller = Get.put(MenuController());
  int currentStep = 0;

  final nama = TextEditingController();
  final alamat = TextEditingController();

  GolSIM? selectedGolSIM;
  List<GolSIM> golonganSIM = [
    GolSIM("SIM A"),
    GolSIM("SIM B I"),
    GolSIM("SIM B II"),
    GolSIM("SIM C"),
    GolSIM("SIM D"),
    GolSIM("SIM D I"),
    GolSIM("SIM A Umum"),
    GolSIM("SIM B I Umum"),
    GolSIM("SIM B II Umum"),
  ];

  List<DropdownMenuItem> generateItemsim(List<GolSIM> golonganSIM) {
    List<DropdownMenuItem> items = [];
    for (var item in golonganSIM) {
      items.add(DropdownMenuItem(
        child: Text(item.gs),
        value: item,
      ));
    }
    return items;
  }

  Permohonan? selectedPermohonan;
  List<Permohonan> jenisPermohonan = [
    Permohonan("Baru"),
    Permohonan("Perpanjang"),
    Permohonan("Peningkatan Golongan"),
    Permohonan("Penurunan Golongan"),
    Permohonan("Pergantian (Hilang)"),
    Permohonan("Pergantian (Rusak)"),
  ];

  List<DropdownMenuItem> generateItempermohonan(
      List<Permohonan> jenisPermohonan) {
    List<DropdownMenuItem> items = [];
    for (var item in jenisPermohonan) {
      items.add(DropdownMenuItem(
        child: Text(item.jp),
        value: item,
      ));
    }
    return items;
  }

  Lokasi? selectedLokasi;
  List<Lokasi> jenisLokasi = [
    Lokasi("SATPAS"),
    Lokasi("SIMLING"),
    Lokasi("GERAI"),
    Lokasi("LAINNYA"),
  ];

  List<DropdownMenuItem> generateItemlokasi(List<Lokasi> jenisLokasi) {
    List<DropdownMenuItem> items = [];
    for (var item in jenisLokasi) {
      items.add(DropdownMenuItem(
        child: Text(item.loc),
        value: item,
      ));
    }
    return items;
  }

  Gender? selectedGender;
  List<Gender> jeniskelamin = [
    Gender("Laki - laki"),
    Gender("Perempuan"),
  ];

  List<DropdownMenuItem> generateItems(List<Gender> jeniskelamin) {
    List<DropdownMenuItem> items = [];
    for (var item in jeniskelamin) {
      items.add(DropdownMenuItem(
        child: Text(item.jk),
        value: item,
      ));
    }
    return items;
  }

  KTP? selectedKTP;
  List<KTP> fotocopyktp = [
    KTP("Ada"),
    KTP("Tidak Ada"),
  ];

  List<DropdownMenuItem> generateItemktp(List<KTP> fotocopyktp) {
    List<DropdownMenuItem> items = [];
    for (var item in fotocopyktp) {
      items.add(DropdownMenuItem(
        child: Text(item.ktp),
        value: item,
      ));
    }
    return items;
  }

  Mata? selectedMata;
  List<Mata> berkacamata = [
    Mata("Iya"),
    Mata("Tidak"),
  ];

  List<DropdownMenuItem> generateItemmata(List<Mata> berkacamata) {
    List<DropdownMenuItem> items = [];
    for (var item in berkacamata) {
      items.add(DropdownMenuItem(
        child: Text(item.mt),
        value: item,
      ));
    }
    return items;
  }

  Fisik? selectedFisik;
  List<Fisik> cacatfisik = [
    Fisik("Iya"),
    Fisik("Tidak"),
  ];

  List<DropdownMenuItem> generateItemfisik(List<Fisik> cacatfisik) {
    List<DropdownMenuItem> items = [];
    for (var item in cacatfisik) {
      items.add(DropdownMenuItem(
        child: Text(item.fi),
        value: item,
      ));
    }
    return items;
  }

  Sertifikat? selectedSertifikat;
  List<Sertifikat> sertifikatmengemudi = [
    Sertifikat("Ada"),
    Sertifikat("Tidak Ada"),
  ];

  List<DropdownMenuItem> generateItemsertifikat(
      List<Sertifikat> sertifikatmengemudi) {
    List<DropdownMenuItem> items = [];
    for (var item in sertifikatmengemudi) {
      items.add(DropdownMenuItem(
        child: Text(item.sft),
        value: item,
      ));
    }
    return items;
  }

  DateTime? tanggal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _controller.scaffoldkey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kDarkBlackColor,
          title: Text("Registrasi"),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.white,
          child: Stepper(
            type: StepperType.horizontal,
            steps: getSteps(),
            currentStep: currentStep,
            onStepContinue: () {
              final isLastStep = currentStep == getSteps().length - 1;
              if (isLastStep) {
                print(
                    'Completed'); //nanti di rubah fungsinya untuk kirim data ke server
              }
              setState(() => currentStep += 1);
            },
            onStepTapped: (step) => setState(() => currentStep = step),
            onStepCancel: currentStep == 0
                ? null
                : () => setState(() => currentStep -= 1),
            controlsBuilder: (BuildContext context, ControlsDetails controls) {
              final isLastStep = currentStep == getSteps().length - 1;
              return Container(
                margin: EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if (currentStep != 0)
                      Container(
                          height: 55,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: 200,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(17),
                            child: ElevatedButton(
                              onPressed: controls.onStepCancel,
                              child: Text('BACK'),
                              style: ElevatedButton.styleFrom(
                                primary: kDarkBlackColor,
                              ),
                            ),
                          )),
                    const SizedBox(width: 12),
                    Container(
                      height: 55,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(17),
                        child: ElevatedButton(
                          onPressed: controls.onStepContinue,
                          child: Text(isLastStep ? 'SIMPAN' : 'NEXT'),
                          style: ElevatedButton.styleFrom(
                            primary: kDarkBlackColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }

  List<Step> getSteps() => [
        //Data Peserta
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: Text(
            "Data Peserta",
            //  style: TextStyle(color: kWhiteColor),
          ),
          content: Container(
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(),
                  ),
                  child: DropdownButton<dynamic>(
                      hint: Text(
                        "Jenis Permohonan",
                      ),
                      isExpanded: true,
                      value: selectedPermohonan,
                      items: generateItempermohonan(jenisPermohonan),
                      onChanged: (item) {
                        setState(() {
                          selectedPermohonan = item;
                        });
                      }),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(),
                  ),
                  child: DropdownButton<dynamic>(
                      hint: Text("Golongan SIM"),
                      isExpanded: true,
                      value: selectedGolSIM,
                      items: generateItemsim(golonganSIM),
                      onChanged: (item) {
                        setState(() {
                          selectedGolSIM = item;
                        });
                      }),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Alamat e-mail",
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor))),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(),
                  ),
                  child: DropdownButton<dynamic>(
                      hint: Text(" Lokasi Kedatangan"),
                      dropdownColor: kPrimaryColor,
                      isExpanded: true,
                      value: selectedLokasi,
                      items: generateItemlokasi(jenisLokasi),
                      onChanged: (item) {
                        setState(() {
                          selectedLokasi = item;
                        });
                      }),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(),
                  ),
                  child: DropdownButton<dynamic>(
                      hint: Text(" Jenis kelamin"),
                      dropdownColor: kPrimaryColor,
                      isExpanded: true,
                      value: selectedGender,
                      items: generateItems(jeniskelamin),
                      onChanged: (item) {
                        setState(() {
                          selectedGender = item;
                        });
                      }),
                ),
              ],
            ),
          ),
        ),

//Data Pribadi
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: Text(
            "Data Pribadi",
            //style: TextStyle(color: kWhiteColor),
          ),
          content: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Nama",
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kDarkBlackColor))),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(),
                ),
                child: DropdownButton<dynamic>(
                    hint: Text(" Jenis kelamin"),
                    dropdownColor: kPrimaryColor,
                    isExpanded: true,
                    value: selectedGender,
                    items: generateItems(jeniskelamin),
                    onChanged: (item) {
                      setState(() {
                        selectedGender = item;
                      });
                    }),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Tanggal Lahir",
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kDarkBlackColor))),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Tinggi Badan",
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kDarkBlackColor))),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Pekerjaan",
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kDarkBlackColor))),
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                    labelText: "No. HP",
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kDarkBlackColor))),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Alamat",
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kDarkBlackColor))),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Pendidikan Terakhir",
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kDarkBlackColor))),
              ),
            ],
          ),
        ),

        Step(
            state: currentStep > 0 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 2,
            title: Text(
              "Data Pribadi",
              // style: TextStyle(color: kWhiteColor),
            ),
            content: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(),
                  ),
                  child: DropdownButton<dynamic>(
                      hint: Text(" Fotocopy KTP"),
                      isExpanded: true,
                      value: selectedKTP,
                      items: generateItemktp(fotocopyktp),
                      onChanged: (item) {
                        setState(() {
                          selectedKTP = item;
                        });
                      }),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(),
                  ),
                  child: DropdownButton<dynamic>(
                      hint: Text("Berkaca-mata"),
                      isExpanded: true,
                      value: selectedMata,
                      items: generateItemmata(berkacamata),
                      onChanged: (item) {
                        setState(() {
                          selectedMata = item;
                        });
                      }),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(),
                  ),
                  child: DropdownButton<dynamic>(
                      hint: Text(
                        "Cacat Fisik",
                      ),
                      isExpanded: true,
                      value: selectedFisik,
                      items: generateItemfisik(cacatfisik),
                      onChanged: (item) {
                        setState(() {
                          selectedFisik = item;
                        });
                      }),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(),
                  ),
                  child: DropdownButton<dynamic>(
                      hint: Text(
                        "Sertifikat Mengemudi",
                      ),
                      isExpanded: true,
                      value: selectedSertifikat,
                      items: generateItemsertifikat(sertifikatmengemudi),
                      onChanged: (item) {
                        setState(() {
                          selectedSertifikat = item;
                        });
                      }),
                ),
              ],
            )),
        Step(
          isActive: currentStep >= 3,
          title: Text(
            "Selesai",
            // style: TextStyle(  color: kWhiteColor)
          ), //Konfirmasi data kalo sdh benar dan ada button simpan
          content: Container(),
        ),
      ];
}

class GolSIM {
  String gs;
  GolSIM(this.gs);
}

class Permohonan {
  String jp;
  Permohonan(this.jp);
}

class Gender {
  String jk;
  Gender(this.jk);
}

class Lokasi {
  String loc;
  Lokasi(this.loc);
}

class KTP {
  String ktp;
  KTP(this.ktp);
}

class Mata {
  String mt;
  Mata(this.mt);
}

class Fisik {
  String fi;
  Fisik(this.fi);
}

class Sertifikat {
  String sft;
  Sertifikat(this.sft);
}
