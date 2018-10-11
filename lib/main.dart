import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  TimeOfDay _time = new TimeOfDay.now();

//  initialTime: new TimeOfDay.now(),

  Future<Null> selectTime(BuildContext context) async {}

  @override
  Widget build(BuildContext context) {
    var status;

    DateTime now = DateTime.now();
    DateFormat dateFormat = new DateFormat.Hms();
    var tes1 = dateFormat.parse("01:30:12");
    var tanggal1 = new DateTime(
        now.year, now.month, now.day, tes1.hour, tes1.minute, tes1.second);
    var tes2 = dateFormat.parse("23:30:12");
    var tanggal2 = new DateTime(
        now.year, now.month, now.day, tes2.hour, tes2.minute, tes2.second);
    final currentTime = DateTime.now();
    if (currentTime.isAfter(tanggal1) && currentTime.isBefore(tanggal2)) {
      status = new Text(
        'Just Success Yeah',
        style: TextStyle(color: Colors.green),
      );
    }
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          title: new Text('Time Picker'),
        ),
        body: new Container(
          child: new Container(
            child: new Column(
              children: <Widget>[status],
            ),
          ),
        ),
      ),
    );
  }
}
