// import 'package:flutter/cupertino.dart';

// import 'category.dart';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// import 'package:flutter_map/flutter_map.dart';
// import 'package:flutter_map/plugin_api.dart';
// import 'package:latlong/latlong.dart';
// import 'category.dart';

class kindergarts {
  static Map<String, LatLng> getCoords() {
    Map<String, LatLng> coords = new Map<String, LatLng>();

    coords.putIfAbsent("KgAirin", () => new LatLng(31.768065, 35.205938));
    coords.putIfAbsent("KgEmuna", () => new LatLng(31.763847, 35.203753));
    coords.putIfAbsent("KgSara", () => new LatLng(31.763462, 35.202031));
    // coords.putIfAbsent(
    //     "PgIndian", () => new LatLng(31.763284290363973, 35.20306830679631));
    // coords.putIfAbsent(
    //     "PgNayot", () => new LatLng(31.76753104751292, 35.20434556986857));
    // coords.putIfAbsent(
    //     "PgGmordehay", () => new LatLng(31.762200789621254, 35.19934961541523));
    // coords.putIfAbsent(
    //     "PgOnya", () => new LatLng(31.7526622923245, 35.193738713758236));
    // coords.putIfAbsent(
    //     "PgPalmach", () => new LatLng(31.767148376393383, 35.208673253673744));
    // coords.putIfAbsent(
    //     "PgGonenim", () => new LatLng(31.755158288853853, 35.20962092162882));
    return coords;
  }

  static bool _zero6 = true;
  static bool _six12 = true;
  static bool _twelve18 = false;
  static bool _eighteenUp = false;
  static bool _one2 = true;
  static bool _three4 = true;
  static bool _five6 = false;
  static bool _seven8 = false;
  static bool _nineUp = false;
  static bool _little = true;
  static bool _oneYear = false;
  static bool _threeYear = false;
  static bool _fiveYear = false;
  static cbox() {
    return [
      new Container(
        padding: EdgeInsets.all(20.0),
        child: Text(
          'גילאים',
          style: TextStyle(fontSize: 15.0),
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.right,
        ),
      ),
      StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
        return Center(
            child: new Container(
          height: 35,
          child: new CheckboxListTile(
              title: Text(
                'מ- 3 חודשים עד שנה',
                textDirection: TextDirection.rtl,
              ),
              controlAffinity: ListTileControlAffinity.leading,
              value: _little,
              onChanged: (bool value) {
                setState(() {
                  _little = value;
                });
              }),
        ));
      }),
      StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
        return Center(
            child: new Container(
          height: 35,
          child: new CheckboxListTile(
              title: Text(
                'שנה עד שלוש',
                textDirection: TextDirection.rtl,
              ),
              value: _oneYear,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool value) {
                setState(() {
                  _oneYear = value;
                });
              }),
        ));
      }),
      StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
        return Center(
            child: new Container(
          height: 35,
          child: new CheckboxListTile(
              title: Text(
                'שלוש עד חמש',
                textDirection: TextDirection.rtl,
              ),
              value: _threeYear,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool value) {
                setState(() {
                  _threeYear = value;
                });
              }),
        ));
      }),
      StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
        return Center(
          // child: new Container(height: 35,
          child: new CheckboxListTile(
              title: Text(
                'חמש עד שש',
                textDirection: TextDirection.rtl,
              ),
              value: _fiveYear,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool value) {
                setState(() {
                  _fiveYear = value;
                });
              }),
        );
      }),
      new Container(
        padding: EdgeInsets.all(20.0),
        child: Text(
          'מספר ילדים',
          style: TextStyle(fontSize: 15.0),
          textDirection: TextDirection.rtl,
        ),
      ),
      StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
        return Center(
            child: new Container(
          height: 35,
          child: new CheckboxListTile(
              title: Text(
                'עד 6 ילדים',
                textDirection: TextDirection.rtl,
              ),
              value: _zero6,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool value) {
                setState(() {
                  _zero6 = value;
                });
              }),
        ));
      }),
      StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
        return Center(
            child: new Container(
          height: 35,
          child: new CheckboxListTile(
              title: Text(
                'מ 6 - 12 ילדים',
                textDirection: TextDirection.rtl,
              ),
              value: _six12,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool value) {
                setState(() {
                  _six12 = value;
                });
              }),
        ));
      }),
      StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
        return Center(
            child: new Container(
          height: 35,
          child: new CheckboxListTile(
              title: Text(
                'מ 12 עד 18 ילדים',
                textDirection: TextDirection.rtl,
              ),
              value: _twelve18,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool value) {
                setState(() {
                  _twelve18 = value;
                });
              }),
        ));
      }),
      StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
        return Center(
          // child: new Container(height: 35,
          child: new CheckboxListTile(
              title: Text(
                'מעל 18 ילדים',
                textDirection: TextDirection.rtl,
              ),
              value: _eighteenUp,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool value) {
                setState(() {
                  _eighteenUp = value;
                });
              }),
        );
      }),
      new Container(
        padding: EdgeInsets.all(20.0),
        child: Text(
          'מספר ילדים למטפלת',
          style: TextStyle(fontSize: 15.0),
          textDirection: TextDirection.rtl,
        ),
      ),
      StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
        return Center(
          child: new Container(
            height: 35,
            child: new CheckboxListTile(
                title: Text(
                  '1 - 2',
                  textDirection: TextDirection.rtl,
                ),
                value: _one2,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (bool value) {
                  setState(() {
                    _one2 = value;
                  });
                }),
          ),
        );
      }),
      StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
        return Center(
            child: new Container(
          height: 35,
          child: new CheckboxListTile(
              title: Text(
                '3 - 4',
                textDirection: TextDirection.rtl,
              ),
              value: _three4,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool value) {
                setState(() {
                  _three4 = value;
                });
              }),
        ));
      }),
      StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
        return Center(
            child: new Container(
          height: 35,
          child: new CheckboxListTile(
              title: Text(
                '5 - 6',
                textDirection: TextDirection.rtl,
              ),
              value: _five6,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool value) {
                setState(() {
                  _five6 = value;
                });
              }),
        ));
      }),
      StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
        return Center(
            child: new Container(
          height: 35,
          child: new CheckboxListTile(
              title: Text(
                '7 - 8',
                textDirection: TextDirection.rtl,
              ),
              value: _seven8,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool value) {
                setState(() {
                  _seven8 = value;
                });
              }),
        ));
      }),
      StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
        return Center(
          // child: new Container(height: 35,
          child: new CheckboxListTile(
              title: Text(
                '9 +',
                textDirection: TextDirection.rtl,
              ),
              value: _nineUp,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool value) {
                setState(() => _nineUp = value);
              }),
        );
      }),
    ];
  }

  static Map<String, LatLng> coords = kindergarts.getCoords();
  static showMarkers() {
    List<Marker> markers = [];
    // markers = new List<Marker>();
    bool kgSara = _little | _zero6 | _one2;
    bool kgAirin = _little | _zero6 | _one2;
    bool kgEmuna = _little | _eighteenUp | _three4;

    List<bool> playgrounds = [kgSara, kgAirin, kgEmuna];
    for (int i = 0; i < coords.length; i++) {
      if (playgrounds[i]) {
        markers.add(
          new Marker(
              // width: 80.0,
              // height: 80.0,
              position: coords.values.elementAt(i),
              // builder: (ctx) => new FlatButton(
              // child: Image.asset('assets/images/kindergarten_icon.png'),
              onTap: () {
                var ctx;
                showModalBottomSheet(
                    context: ctx,
                    backgroundColor: Colors.transparent,
                    builder: (BuildContext context) {
                      return Container(
                        color: Colors.white,
                        margin: const EdgeInsets.all(0.0),
                        padding: EdgeInsets.all(0.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Container(
                              margin: const EdgeInsets.all(0.0),
                              padding: EdgeInsets.all(0.0),
                              child: new Row(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 2.0, top: 0.0),
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/gMordechay1.jpg'),
                                      width: 200.0,
                                      height: 200.0,
                                    ),
                                  ),
                                  Image(
                                    image: AssetImage(
                                        'assets/images/gMordechay2.jpg'),
                                    width: 200.0,
                                    height: 200.0,
                                  ),
                                ],
                              ),
                            ),
                            new Container(
                              color: Colors.white,
                              margin: const EdgeInsets.all(0.0),
                              padding: EdgeInsets.all(0.0),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 0.0),
                                    child: Text(
                                      'המשפחתון של איירין',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                  ),
                                  Image(
                                    image:
                                        AssetImage('assets/images/stars.png'),
                                    width: 70.0,
                                    height: 70.0,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 20.0),
                              child: Text(
                                '050-1234567',
                                textAlign: TextAlign.right,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(right: 20.0, bottom: 10.0),
                              child: Text(
                                ' שתי מטפלות\nעד שמונה ילדים',
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 11.0),
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              }),
        );
      }
    }
    return markers;
  }
}
