import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '1/Page1.dart';
import '1/Page12.dart';
import '1/Pagea1.dart';
import '2/Page2.dart';
import '3/Page3.dart';
import '4/Page4.dart';
import '5/Page5.dart';
import '6/Page6.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home(),
    );
  }
}

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Đây là trang chủ - không thể thực hiện tác vụ quay lại !!!')));
      return false;
    },
    child:  Scaffold(
      //   theme: ThemeData(
      //       primarySwatch: Colors.grey,
      //     ),
      //     home: Scaffold(body: SafeArea(
      // child: Container(
      //     constraints: BoxConstraints.expand(),
      //     decoration: BoxDecoration(
      //       image: DecorationImage(
      //         image: NetworkImage(
      //             "https://images.unsplash.com/photo-1604705528621-81b2755a320b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c3VwZXJjYXJ8ZW58MHx8MHx8&w=1000&q=80"),
      //         fit: BoxFit.cover,
      //       ),
      //     ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://images.unsplash.com/photo-1604705528621-81b2755a320b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c3VwZXJjYXJ8ZW58MHx8MHx8&w=1000&q=80"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // const Icon(Icons.security, size: 150, color: Colors.yellow, ),
              Image.asset('images/logo.png', width: 150,height: 120),

              const Text(
                "CỔNG DỊCH VỤ ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 43,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "ĐĂNG KIỂM VÀ BẢO HIỂM XE  ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                " CƠ GIỚI ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                FlatButton(
                  shape: StadiumBorder(),
                  color: Colors.white,
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    // Replace with a Row for horizontal icon + text
                    children: <Widget>[
                      SizedBox( height: 5),
                      Icon(Icons.calendar_today),
                      Text("ĐẶT LỊCH ĐĂNG KIỂM"),
                      SizedBox( height: 5),
                    ],
                  ),
                  onPressed: () {
                    print('đã bấm nút ');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>const Pagea1(title: "CỔNG DỊCH VỤ ĐĂNG KIỂM")),
                    );
                  },
                ),
                SizedBox(width: 20, height: 20),
                FlatButton(
                  shape: StadiumBorder(),
                  color: Colors.white,
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    // Replace with a Row for horizontal icon + text
                    children: <Widget>[
                      SizedBox( height: 10),
                      Icon(Icons.perm_contact_calendar),
                      Text("ĐẶT DỊCH VỤ ĐĂNG KIỂM"),
                      SizedBox( height: 10),
                    ],
                  ),
                  onPressed: () {
                    print('đã bấm nút ');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Page2()),
                    );
                  },
                ),
              ]),
              SizedBox(width: 20, height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                FlatButton(
                  shape: StadiumBorder(),
                  color: Colors.white,
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    // Replace with a Row for horizontal icon + text
                    children: <Widget>[
                      SizedBox( height: 5),
                      Icon(Icons.monetization_on_outlined),
                      SizedBox( height: 4),
                      Text("ĐÓNG PHÍ ĐĂNG KIỂM"),
                      SizedBox( height: 5),
                    ],
                  ),
                  onPressed: () {
                    print('đã bấm nút ');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Page3()),
                    );
                  },
                ),
                SizedBox(width: 20, height: 20),

                FlatButton(
                  shape: StadiumBorder(),
                  color: Colors.white,
                  padding: EdgeInsets.all(14.0),
                  child: Column(
                    // Replace with a Row for horizontal icon + text
                    children: <Widget>[
                      Icon(Icons.directions_car),
                      Text("MUA BẢO HIỂM TNDS "),
                      Text("Ô TÔ")
                    ],
                  ),
                  onPressed: () {
                    print('đã bấm nút ');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Page5()),
                    );
                  },
                ),
              ]),
              SizedBox(width: 20, height: 20),

              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                FlatButton(
                  shape: StadiumBorder(),
                  color: Colors.white,
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    // Replace with a Row for horizontal icon + text
                    children: <Widget>[
                      Icon(Icons.motorcycle_sharp),
                      Text("MUA BẢO HIỂM TNDS "),
                      Text("XE MÁY")
                    ],
                  ),
                  onPressed: () {
                    print('đã bấm nút ');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Page4()),
                    );
                  },
                ),
                SizedBox(width: 20, height: 20),

                FlatButton(
                  shape: StadiumBorder(),
                  color: Colors.white,
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    // Replace with a Row for horizontal icon + text
                    children: <Widget>[
                      Icon(Icons.local_car_wash_outlined),
                      Text("MUA BẢO HIỂM THÂN"),
                      Text("VỎ XE")
                    ],
                  ),
                  onPressed: () {
                    print('đã bấm nút ');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Page6()),
                    );
                  },
                ),
              ])
            ],
          ),
        ),
      ),
    ) );
  }
}
