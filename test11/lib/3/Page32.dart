import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../1/Page1.dart';
import 'Page33.dart';
import '../main.dart';
import 'package:intl/intl.dart';
import 'package:cupertino_radio_choice/cupertino_radio_choice.dart';
// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:cupertino_date_textbox/cupertino_date_textbox.dart';
import '../1/Page13.dart';

class Page32 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<Page32> with WidgetsBindingObserver {
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

  String _selectedDate = 'Ch???n th???i gian ????ng';
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
  List<String> provinces1 = [];
  List<String> provinces = [];
  String? selectedCountry;
  String? selectedProvince;
  String? selectedsohuu;
  @override
  // final String formattedDate = DateFormat.yMd().format(_selectedDateTime);
  // final selectedText = Text('You selected: $formattedDate');
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Giao di???n th???c t???p",
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.grey[800],
              title: Center(
                  child: Column(children: <Widget>[
                    const Icon(
                      Icons.security,
                      color: Colors.yellow,
                      size: 29,
                    ),
                    SizedBox(width: 20, height: 7),
                    const Text('C???NG D???CH V??? ????NG KI???M B???O HI???M',
                        style: TextStyle(fontSize: 17)),
                  ])),
            ),
            body: SingleChildScrollView(

              // padding: EdgeInsets.only(bottom: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 20, height: 20),
                    const Text(
                      '????NG PH?? ???????NG B??? TR???C TI???P',
                      style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 20, height: 30),
                    InputDecorator(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        contentPadding: EdgeInsets.all(5),
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        hint: const Text(
                          "H??ng xe",
                          style: TextStyle(fontSize: 17),
                        ),
                        value: dropdownValue,
                        elevation: 16,
                        style: const TextStyle(color: Colors.lightBlue),
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
                    ),
                    SizedBox(width: 20, height: 10),

                    InputDecorator(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        contentPadding: EdgeInsets.all(5),
                      ),
                      child: DropdownButton<String>(
                        hint: const Text(
                          "Lo???i ph????ng ti???n ",
                          style: TextStyle(fontSize: 17),
                        ),
                        value: selectedCountry,
                        isExpanded: true,
                        items: provinces1.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        underline: SizedBox(),
                        onChanged: (country) {


                          setState(() {
                            selectedProvince = null;
                            selectedCountry = country;
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 20, height: 10),
                    InputDecorator(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        contentPadding: EdgeInsets.all(5),
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        hint: const Text(
                          "N??m s???n xu???t",
                          style: TextStyle(fontSize: 17),
                        ),
                        value: dropdownValue1,
                        elevation: 16,
                        style: const TextStyle(color: Colors.lightBlue),
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
                          '1996',
                          '1997',
                          '1998',
                          '1999',
                          '2000',
                          '2001',
                          '2002',
                          '2003',
                          '2004',
                          '2005',
                          '2006',
                          '2007',
                          '2008',
                          '2009',
                          '2010',
                          '2011',
                          '2012',
                          '2013',
                          '2014',
                          '2015',
                          '2016',
                          '2017',
                          '2018',
                          '2019',
                          '2020',
                          '2021'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(width: 20, height: 10),
                    TextField(
                      controller: hinhthucEditingController,
                      onChanged: (text) {
                        this.setState(() {
                          _hinhthuc =
                              text; // khi state thay ?????i => build() return => reload widget
                        });
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              //b??n k??nh c???a vi???n
                                const Radius.circular(20) //bo g??c t??nh theo pixel
                            ),
                          ),
                          labelText: "H??nh th???c"),
                    ),
                    SizedBox(width: 20, height: 10),
                    InputDecorator(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        contentPadding: EdgeInsets.all(5),
                      ),
                      child: DropdownButton<String>(
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
                            provinces1 = countries;
                          } else if (cba == 'Doanh nghi???p') {
                            provinces1 = countries2;
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
                    ),

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





                    new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          FlatButton(
                            child: Text('QUAY L???I'),
                            textColor: Colors.white,
                            color: Colors.yellow[600],

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
                                  builder: (context) => Page33()));
                            },
                          ),
                        ]),

                  ],
                ))));
  }

  void onGenderSelected(String genderKey) {
    setState(() {
      _selectedGender = genderKey;
    });
  }
}

