import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, double> _currentLocation;

  StreamSubscription<Map<String, double>> _locationSubscription;

  Location _location = new Location();

  @override
  void initState() {
    super.initState();

    _locationSubscription =
        _location.onLocationChanged().listen((Map<String, double> result) {
      setState(() {
        _currentLocation = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var lat1 = _currentLocation["latitude"];
    var lon1 = _currentLocation["longitude"];
    var R = 6371e3; // metres
    var lat2 = -6.232805;
    var lon2 = 106.856400;
    var psy1 = lat1 * 0.017;
    var psy2 = lat2 * 0.017;
    var deltapsy1 = (lat2 - lat1) * 0.017;
    var deltapsy2 = (lon2 - lon1) * 0.017;

    var a = sin(deltapsy1 / 2) * sin(deltapsy1 / 2) +
        cos(psy1) * cos(psy2) * sin(deltapsy2 / 2) * sin(deltapsy2 / 2);

    var c = 2 * atan2(sqrt(a), sqrt(1 - a));
    var d = (R * c) / 1000;
    var distance = d.toStringAsFixed(2);
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Distance calculator'),
        ),
        body: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Text('Current Latitude : $lat1'),
            new Text('Current Longitude : $lon1'),
            new Text('Distance : $distance KM'),
          ],
        ),
      ),
    );
  }
}
