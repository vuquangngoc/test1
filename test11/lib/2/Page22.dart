import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../1/Page1.dart';
import 'Page23.dart';
import '../main.dart';
import 'package:intl/intl.dart';
import 'package:cupertino_radio_choice/cupertino_radio_choice.dart';
// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:cupertino_date_textbox/cupertino_date_textbox.dart';
import '../1/Page13.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/phuongtiendangkiem.dart';
import '../model/phuongtienduongbo.dart';


class Page22 extends StatefulWidget {
  // Page12(
  //     {required this.initialValue,
  //       required this.onDateChange,
  //       required this.hintText,
  //       this.color = CupertinoColors.label,
  //       this.hintColor = CupertinoColors.inactiveGray,
  //       this.pickerBackgroundColor = CupertinoColors.systemBackground,
  //       this.fontSize = 17.0,
  //       this.textfieldPadding = 15.0,
  //       this.enabled = true});
  //
  // final DateTime initialValue;
  // final Function onDateChange;
  // final String hintText;
  // final Color color;
  // final Color hintColor;
  // final Color pickerBackgroundColor;
  // final double fontSize;
  // final double textfieldPadding;
  // final bool enabled;
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<Page22> with WidgetsBindingObserver {
  final hinhthucEditingController = TextEditingController();

  String _hinhthuc = "something";
  String? dropdownValue;
  String? dropdownValue1;
  String? dropdownValue2;
  String? dropdownValue3;
  String? dropdownValue4;
  String? dropdownValue5;

  // String _selectedDate = 'Tap to select date';
  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? d = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2015),
  //     lastDate: DateTime(2020),
  //   );
  //   if (d != null)
  //     setState(() {
  //       _selectedDate = new DateFormat.yMMMMd("en_US").format(d);
  //     });
  // }
  static final Map<String, String> genderMap = {
    'a1': '08:00',
    'a2': '08:30',
    'a3': '09:00',
    'a4': '09:30',
    'a5': '10:00',
    'a6': '10:30',
    'a7': '11:00',
    'a8': '11:30',
    'a9': '13:30',
    'a10': '14:00',
    'a11': '14:30',
    'a12': '15:00',
    'a13': '15:30',
    'a14': '16:00',
  };
  String _selectedGender = genderMap.keys.first;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (d != null)
      setState(() {
        _selectedDate = new DateFormat.yMMMMd("en_US").format(d);
      });
  }

  String _selectedDate = 'Ng??y ??i ????ng ki???m';

  List<String> sohuu = ['C?? nh??n', 'Doanh nghi???p'];
  List<String> countries = [
    '?? t?? d?????i 10 ch??? ng???i',
  ];
  List<String> countries2 = [
    '?? t?? d?????i 10 ch???',
    '?? t?? t???i c?? tr???ng t???i ?????n 2 t???n (bao g???m c??? xe ?? t?? b??n t???i)',
    '?? t?? t???i, ??o??n ?? t?? (?? t?? ?????u k??o + s?? mi r?? mooc), c?? tr???ng t???i tr??n 20 t???n v?? c??c lo???i ?? t?? chuy??n d??ng',

    '?? t?? t???i, ??o??n ?? t?? (?? t?? ?????u k??o + s?? mi r?? mooc), c?? tr???ng t???i tr??n 7 t???n ?????n 20 t???n v?? c??c lo???i m??y k??o',
    '?? t?? t???i c?? tr???ng t???i tr??n 2 t???n ?????n 7 t???n',
    'M??y k??o b??ng sen, c??ng n??ng v?? c??c lo???i v???n chuy???n t????ng t???',
    'R?? mo??c v?? s?? mi r?? mo??c',
    '?? t?? kh??ch tr??n 40 gh??? (k??? c??? l??i xe), xe bu??t',
    '?? t?? kh??ch t??? 25 ?????n 40 gh??? (k??? c??? l??i xe)',
    '?? t?? kh??ch t??? 10 ?????n 24 gh??? (k??? c??? l??i xe)',
    '?? t?? c???u th????ng',
  ];
  List<String> usaProvince = [
    'Xe ch??? ng?????i d?????i 10 ch??? ????ng k?? t??n c?? nh??n',
  ];
  List<String> usaProvince1 = [
    'Xe ch??? ng?????i d?????i 10 ch??? (tr??? xe ????ng k?? t??n c?? nh??n); xe t???i, xe ?? t?? chuy??n d??ng c?? kh???i l?????ng to??n b??? d?????i 4.000 kg; c??c lo???i xe bu??t v???n t???i h??nh kh??ch c??ng c???ng (bao g???m c??? xe ????a ????n h???c sinh, sinh vi??n, c??ng nh??n ???????c h?????ng ch??nh s??ch tr??? gi?? nh?? xe bu??t); xe ch??? h??ng v?? xe ch??? ng?????i 4 b??nh c?? g???n ?????ng c??',
  ];
  List<String> usaProvince2 = [
    'Xe ch??? ng?????i t??? 10 ch??? ?????n d?????i 25 ch???; xe t???i, xe ?? t?? chuy??n d??ng c?? kh???i l?????ng to??n b??? t??? 4.000 kg ?????n d?????i 8.500 kg',
    'Xe ch??? ng?????i t??? 25 ch??? ?????n d?????i 40 ch???; xe t???i, xe ?? t?? chuy??n d??ng c?? kh???i l?????ng to??n b??? t??? 8.500 kg ?????n d?????i 13.000 kg',
    'Xe ch??? ng?????i t??? 40 ch??? tr??? l??n; xe t???i, xe ?? t?? chuy??n d??ng c?? kh???i l?????ng to??n b??? t??? 13.000 kg ?????n d?????i 19.000 kg; xe ?????u k??o c?? kh???i l?????ng b???n th??n c???ng v???i kh???i l?????ng cho ph??p k??o theo ?????n d?????i 19.000 kg',
    'Xe t???i, xe ?? t?? chuy??n d??ng c?? kh???i l?????ng to??n b??? t??? 19.000 kg ?????n d?????i 27.000 kg; xe ?????u k??o c?? kh???i l?????ng b???n th??n c???ng v???i kh???i l?????ng cho ph??p k??o theo t??? 19.000 kg ?????n d?????i 27.000 kg',
    'Xe t???i, xe ?? t?? chuy??n d??ng c?? kh???i l?????ng to??n b??? t??? 27.000 kg tr??? l??n; xe ?????u k??o c?? kh???i l?????ng b???n th??n c???ng v???i kh???i l?????ng cho ph??p k??o theo t??? 27.000 kg ?????n d?????i 40.000 kg',
    'Xe ?? t?? ?????u k??o c?? kh???i l?????ng b???n th??n c???ng v???i kh???i l?????ng cho ph??p k??o theo t??? 40.000 kg tr??? l??n',
  ];
  List<String> provinces1 = [];
  List<String> provinces = [];
  String? selectedCountry;
  String? selectedProvince;
  String? selectedsohuu;
  dsphuongtiendangkiem? selectdsphuongtiendangkiem;
  List<dsphuongtiendangkiem> listdsphuongtiendangkiem = [];
  dsphuongtienduongbo? selectdsphuongtienduongbo;
  List<dsphuongtienduongbo> listdsphuongtienduongbo=[];

  getdsphuongtiendangkiem() async {
    const String url = 'https://api.dangkiem.online/api/Vehicle/false';
    var response = await http.get(Uri.parse(url));
    List<dynamic> jsonResponse = jsonDecode(response.body);
    setState(() {
      listdsphuongtiendangkiem = List<dsphuongtiendangkiem>.from(
          jsonResponse.map((it) => dsphuongtiendangkiem.fromJson(it)));
    });
  }
  getdsphuongtienduongbo(int id) async {
    String url = 'https://api.dangkiem.online/api/Vehicle/true';
    var response = await http.get(Uri.parse(url));
    List<dynamic> jsonResponse = jsonDecode(response.body);
    setState(() {
      listdsphuongtienduongbo = List<dsphuongtienduongbo>.from(
          jsonResponse.map((dk) => dsphuongtienduongbo.fromJson(dk)));
    });}


  @override
  void initState() {

    super.initState();
    getdsphuongtiendangkiem();
  }
  onChanephuongtiendangkiem(dsphuongtiendangkiem? value){
    setState(() {
      selectdsphuongtiendangkiem=value;
    });
    var id=value!.vehicleId;
    getdsphuongtienduongbo(id);
  }

  @override
  // final String formattedDate = DateFormat.yMd().format(_selectedDateTime);
  // final selectedText = Text('You selected: $formattedDate');
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Giao di???n th???c t???p",
        home: Scaffold(
            appBar:PreferredSize(
        preferredSize: Size.fromHeight(70.0), // here the desired height
    child:  AppBar(
              backgroundColor: Colors.grey[800],

              title: Center(
                  child: Column(children: <Widget>[
                    Image.asset('images/logo.png', width: 50,height: 35),

                    SizedBox(width: 20, height: 0),
                const Text('C???NG D???CH V??? ????NG KI???M B???O HI???M',
                    style: TextStyle(fontSize: 17)),
              ])),
    )  ),
            body: SingleChildScrollView(

                // padding: EdgeInsets.only(bottom: 15),
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 20, height: 20),
                const Text(
                  '?????T D???CH V??? ????NG KI???M',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'NH???N V?? GIAO XE T???I NH??',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                SizedBox(width: 20, height: 30),
                InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      contentPadding: EdgeInsets.all(3),
                    ),
                    child:
                    Padding(
                        padding: EdgeInsets.only(
                            left: 18,
                            top: 0, bottom: 0, right: 0
                        ),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,

                            ),
                            child: DropdownButtonHideUnderline(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    // left: 14.0, right: 14
                                  ),
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    hint: const Text(
                                      "H??ng xe",
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    value: dropdownValue,
                                    elevation: 16,

                                    style: const TextStyle(color: Colors.black, ),
                                    underline: Container(
                                      height: 2,
                                      color: Colors.white,
                                    ),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownValue = newValue!;
                                      });
                                    },
                                    items: <String>[
                                      'Honda',
                                      'Huyndai',
                                      'Toyota',
                                      'Mazda',
                                      'KIA'
                                    ].map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ))))  ),
                SizedBox(width: 20, height: 10),
                InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      contentPadding: EdgeInsets.all(3),
                    ),
                    child:
                    Padding(
                        padding: EdgeInsets.only(
                            left: 18,
                            top: 0, bottom: 0, right: 0
                        ),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,

                            ),
                            child: DropdownButtonHideUnderline(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    // left: 14.0, right: 14
                                  ),
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    hint: const Text(
                                      "N??m s???n xu???t",
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    value: dropdownValue1,
                                    elevation: 16,
                                    style: const TextStyle(color: Colors.black),
                                    underline: Container(
                                      height: 2,
                                      color: Colors.white,
                                    ),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownValue1 = newValue!;
                                      });
                                    },
                                    items: <String>[
                                      '1996', '1997', '1998', '1999', '2000', '2001', '2002', '2003', '2004', '2005', '2006', '2007', '2008', '2009', '2010', '2011', '2012', '2013', '2014', '2015', '2016', '2017', '2018', '2019', '2020', '2021'
                                    ].map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ))))   ),
                SizedBox(width: 20, height: 10),
                InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      contentPadding: EdgeInsets.all(3),
                    ),
                    child:
                    Padding(
                        padding: EdgeInsets.only(
                            left: 18,
                            top: 0, bottom: 0, right: 0
                        ),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,

                            ),
                            child: DropdownButtonHideUnderline(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    // left: 14.0, right: 14
                                  ),
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    hint: const Text(
                                      "H??nh th???c",
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    value: dropdownValue2,
                                    elevation: 16,

                                    style: const TextStyle(color: Colors.black, ),
                                    underline: Container(
                                      height: 2,
                                      color: Colors.white,
                                    ),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownValue2 = newValue!;
                                      });
                                    },
                                    items: <String>[
                                      'C?? kinh doanh v???n t???i',
                                      'Kh??ng kinh doanh v???n t???i'
                                    ].map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ))))     ),
                SizedBox(width: 20, height: 10),
                InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      contentPadding: EdgeInsets.all(3),
                    ),
                    child:
                    Padding(
                        padding: EdgeInsets.only(
                            left: 18,
                            top: 0, bottom: 0, right: 0
                        ),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,

                            ),
                            child: DropdownButtonHideUnderline(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    // left: 14.0, right: 14
                                  ),          child:   DropdownButton<String>(
                                  hint: const Text(
                                    "S??? h???u",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  underline: SizedBox(),
                                  value: selectedsohuu,
                                  isExpanded: true,
                                  items: sohuu.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (cba) {
                                    if (cba == 'C?? nh??n') {
                                      provinces1=countries;
                                    } else if (cba == 'Doanh nghi???p') {
                                      provinces1 =countries2;
                                    } else {
                                      provinces1 = [];
                                    }
                                    setState(() {
                                      selectedCountry = null;
                                      selectedProvince = null;
                                      selectedsohuu = cba;
                                    });
                                  },
                                ),
                                ))))  ),
                SizedBox(width: 20, height: 10),
                InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      contentPadding: EdgeInsets.all(3),
                    ),
                    child:
                    Padding(
                        padding: EdgeInsets.only(
                            left: 18,
                            top: 0, bottom: 0, right: 0
                        ),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,

                            ),
                            child: DropdownButtonHideUnderline(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    // left: 14.0, right: 14
                                  ),
                                  child:  DropdownButton<dsphuongtiendangkiem>(
                                    hint: const Text("Lo???i ph????ng ti???n theo quy ?????nh ????ng ki???m",),
                                    underline: SizedBox(),
                                    value: selectdsphuongtiendangkiem,
                                    iconSize: 36,
                                    isExpanded: true,
                                    items: listdsphuongtiendangkiem.map((dsphuongtiendangkiem item) {
                                      return DropdownMenuItem<dsphuongtiendangkiem>(
                                        child: Text( item.nameVehicle),
                                        value: item,
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      onChanephuongtiendangkiem(value);
                                      selectdsphuongtienduongbo = null;
                                    },
                                  ),
                                ))))),


                SizedBox(width: 20, height: 10),
                InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      contentPadding: EdgeInsets.all(3),
                    ),
                    child:
                    Padding(
                        padding: EdgeInsets.only(
                            left: 18,
                            top: 0, bottom: 0, right: 0
                        ),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,

                            ),
                            child: DropdownButtonHideUnderline(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    // left: 14.0, right: 14
                                  ),
                                  child:  DropdownButton<dsphuongtienduongbo>(
                                    hint: const Text("Lo???i ph????ng ti???n theo qui ?????nh l??u th??ng ???????ng b???",),
                                    underline: SizedBox(),
                                    value: selectdsphuongtienduongbo,
                                    iconSize: 36,
                                    isExpanded: true,
                                    items: listdsphuongtienduongbo.map((dsphuongtienduongbo item) {
                                      return DropdownMenuItem<dsphuongtienduongbo>(
                                        child: Text( item.nameVehicle),
                                        value: item,
                                      );
                                    }).toList(),
                                    onChanged: (valuephuongtienduongbo) {
                                      setState(() {
                                        selectdsphuongtienduongbo =valuephuongtienduongbo!;
                                      });

                                    },
                                  ),
                                )))) ),


                SizedBox(width: 20, height: 10),


                Container(
                  decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 1.0, color: Colors.grey),
                        left: BorderSide(width: 1.0, color: Colors.grey),
                        right: BorderSide(width: 1.0, color: Colors.grey),
                        bottom: BorderSide(width: 1.0, color: Colors.grey),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        InkWell(
                          child: Text(_selectedDate,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.grey[700], fontSize: 18)),
                          // "${selectedDate.toLocal()}".split(' ')[0],
                          // style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          // ),
                          onTap: () {
                            _selectDate(context);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.calendar_today),
                          tooltip: 'Tap to open date picker',
                          onPressed: () {
                            _selectDate(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(width: 20, height: 10),

                // Text(
                //   "${selectedDate.toLocal()}".split(' ')[0],
                //   style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                // ),
                // SizedBox(
                //   height: 20.0,
                // ),
                // RaisedButton(
                //   onPressed: () => _selectDate(context),
                //   child: Text(
                //     'Select date',
                //     style:
                //     TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                //   ),
                //   color: Colors.greenAccent,
                // ),

                // Row(
                //    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //    children: <Widget>[
                //      InputDecorator(
                //        decoration: InputDecoration(
                //          border: OutlineInputBorder(
                //              borderRadius: BorderRadius.circular(20.0)),
                //          contentPadding: EdgeInsets.all(5),
                //        ),
                //        child: DropdownButton<String>(
                //          isExpanded: true,
                //          hint: const Text(
                //            "H??ng xe",
                //            style: TextStyle(fontSize: 17),
                //          ),
                //          value: dropdownValue,
                //          elevation: 16,
                //          style: const TextStyle(color: Colors.lightBlue),
                //          underline: Container(
                //            height: 2,
                //            color: Colors.white,
                //          ),
                //          onChanged: (String? newValue) {
                //            setState(() {
                //              dropdownValue = newValue!;
                //            });
                //          },
                //          items: <String>['Honda', 'Huyndai', 'Toyota', 'Mazda', 'KIA']
                //              .map<DropdownMenuItem<String>>((String value) {
                //            return DropdownMenuItem<String>(
                //              value: value,
                //              child: Text(value),
                //            );
                //          }).toList(),
                //        ),
                //      ),
                //      InputDecorator(
                //        decoration: InputDecoration(
                //          border: OutlineInputBorder(
                //              borderRadius: BorderRadius.circular(20.0)),
                //          contentPadding: EdgeInsets.all(5),
                //        ),
                //        child: DropdownButton<String>(
                //          isExpanded: true,
                //          hint: const Text(
                //            "H??ng xe",
                //            style: TextStyle(fontSize: 17),
                //          ),
                //          value: dropdownValue,
                //          elevation: 16,
                //          style: const TextStyle(color: Colors.lightBlue),
                //          underline: Container(
                //            height: 2,
                //            color: Colors.white,
                //          ),
                //          onChanged: (String? newValue) {
                //            setState(() {
                //              dropdownValue = newValue!;
                //            });
                //          },
                //          items: <String>['Honda', 'Huyndai', 'Toyota', 'Mazda', 'KIA']
                //              .map<DropdownMenuItem<String>>((String value) {
                //            return DropdownMenuItem<String>(
                //              value: value,
                //              child: Text(value),
                //            );
                //          }).toList(),
                //        ),
                //      ),
                //      InputDecorator(
                //        decoration: InputDecoration(
                //          border: OutlineInputBorder(
                //              borderRadius: BorderRadius.circular(20.0)),
                //          contentPadding: EdgeInsets.all(5),
                //        ),
                //        child: DropdownButton<String>(
                //          isExpanded: true,
                //          hint: const Text(
                //            "H??ng xe",
                //            style: TextStyle(fontSize: 17),
                //          ),
                //          value: dropdownValue,
                //          elevation: 16,
                //          style: const TextStyle(color: Colors.lightBlue),
                //          underline: Container(
                //            height: 2,
                //            color: Colors.white,
                //          ),
                //          onChanged: (String? newValue) {
                //            setState(() {
                //              dropdownValue = newValue!;
                //            });
                //          },
                //          items: <String>['Honda', 'Huyndai', 'Toyota', 'Mazda', 'KIA']
                //              .map<DropdownMenuItem<String>>((String value) {
                //            return DropdownMenuItem<String>(
                //              value: value,
                //              child: Text(value),
                //            );
                //          }).toList(),
                //        ),
                //      ),
                //
                //    ]),

                // Container(
                //   height: 200,
                //   child: CupertinoDatePicker(
                //     mode: CupertinoDatePickerMode.date,
                //     initialDateTime: DateTime(1969, 1, 1),
                //     onDateTimeChanged: (DateTime newDateTime) {
                //       // Do something
                //     },
                //   ),
                // ),

                // InkWell(
                //   child: Text(
                //       _selectedDate,
                //       textAlign: TextAlign.center,
                //       style: TextStyle(color: Color(0xFF000000))
                //   ),
                //   onTap: (){
                //     _selectDate(context);
                //   },
                // ),
                // IconButton(
                //   icon: Icon(Icons.calendar_today),
                //   tooltip: 'Tap to open date picker',
                //   onPressed: () {
                //     _selectDate(context);
                //   },
                // ),
                //

                // new Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: <Widget>[  const Padding(
                //         padding: EdgeInsets.only(bottom: 5.0),
                //       ),
                //       CupertinoRadioChoice(
                //           choices: genderMap,
                //           onChange: onGenderSelected,
                //           initialKeyValue: _selectedGender),
                //       ]
                // ),

                new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FlatButton(
                        child: Text('QUAY L???I'),
                        textColor: Colors.white,
                        color: Colors.brown[600],

                        // onPressed: () {
                        //   print('???? b???m n??t quay l???i page 1');
                        // Navigator.of(context).push(
                        //     MaterialPageRoute(builder: (context) => Page1()));
                        //
                        // },
                        onPressed: () {
                          print('???? b???m n??t quay l???i page 1');
                          Navigator.pop(context);
                        },
                      ),
                      FlatButton(
                        child: Text('TI???P T???C'),
                        textColor: Colors.white,
                        color: Colors.yellow[800],
                        onPressed: () {
                          print('???? b???m n??t ti???p t???c');
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Page23()));
                        },
                      ),
                    ]),

                // DropdownButton<String>(
                //   value: dropdownValue,
                //   icon: const Icon(Icons.arrow_downward),
                //   iconSize: 24,
                //   elevation: 16,
                //   style: const TextStyle(
                //       color: Colors.deepPurple
                //   ),
                //   underline: Container(
                //     height: 2,
                //     color: Colors.deepPurpleAccent,
                //   ),
                //   onChanged: (String? newValue) {
                //     setState(() {
                //       dropdownValue = newValue!;
                //     });
                //   },
                //   items: <String>['One', 'Two', 'Free', 'Four']
                //       .map<DropdownMenuItem<String>>((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(value),
                //     );
                //   })
                //       .toList(),
                // ),
              ],
            ))));
  }

  void onGenderSelected(String genderKey) {
    setState(() {
      _selectedGender = genderKey;
    });
  }
}
// void onBirthdayChange(DateTime birthday) {
//   setState(() {
//     _selectedDateTime = birthday;
//   });
// }
// }
