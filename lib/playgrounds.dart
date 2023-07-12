import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// import 'package:flutter_map/flutter_map.dart';
// import 'package:flutter_map/plugin_api.dart';
// import 'package:latlong/latlong.dart';
// import 'category.dart';

class pgrounds {
  // class MapScreen extends StatelessWidget {

  static Map<String, LatLng> getCoords() {
    Map<String, LatLng> coords = new Map<String, LatLng>();

    coords.putIfAbsent("PgShimoni", () => new LatLng(31.763725, 35.202158));
    coords.putIfAbsent("PgMichvar", () => new LatLng(31.756790, 35.203533));
    coords.putIfAbsent("PgPillbox", () => new LatLng(31.769325, 35.209223));
    coords.putIfAbsent(
        "PgIndian", () => new LatLng(31.763284290363973, 35.20306830679631));
    coords.putIfAbsent(
        "PgNayot", () => new LatLng(31.76753104751292, 35.20434556986857));
    coords.putIfAbsent(
        "PgGmordehay", () => new LatLng(31.762200789621254, 35.19934961541523));
    coords.putIfAbsent(
        "PgOnya", () => new LatLng(31.7526622923245, 35.193738713758236));
    coords.putIfAbsent(
        "PgPalmach", () => new LatLng(31.767148376393383, 35.208673253673744));
    coords.putIfAbsent(
        "PgGonenim", () => new LatLng(31.755158288853853, 35.20962092162882));
    return coords;
  }

  static bool _litSwing = true;
  static bool _allSwing = false;
  static bool _litSlide = true;
  static bool _bigSlide = false;

  static cbox() {
    return [
      new Container(
        padding: EdgeInsets.all(20.0),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Text(
              'מתקנים',
              style: TextStyle(fontSize: 17.0),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
            ),
          ),
          // Padding (padding: EdgeInsets.only(right: 25.0), child: Text('נדנדות', style: TextStyle(fontSize: 15.0), textDirection: TextDirection.rtl, textAlign: TextAlign.right,),),
        ]),
      ),
      Padding(
        padding: EdgeInsets.only(right: 25.0),
        child: Text(
          'נדנדות',
          style: TextStyle(fontSize: 15.0),
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.right,
        ),
      ),
      StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
        return Center(
          child: new Container(
            padding: EdgeInsets.only(right: 10.0),
            height: 35,
            child: new CheckboxListTile(
                title: Text(
                  'נדנדה בטיחותית לקטנטנים',
                  textDirection: TextDirection.rtl,
                ),
                value: _litSwing,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (bool value) {
                  setState(() {
                    _litSwing = value;
                  });
                  print('change litSwing');
                }),
          ),
        );
      }),
      StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
        return Center(
          child: new Container(
            padding: EdgeInsets.all(10.0),
            // child: new Container(height: 35,
            child: new CheckboxListTile(
                title: Text(
                  'נדנדה לגדולים',
                  textDirection: TextDirection.rtl,
                ),
                value: _allSwing,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (bool value) {
                  setState(() {
                    _allSwing = value;
                  });
                }),
          ),
        );
      }),
      Padding(
        padding: EdgeInsets.only(right: 25.0),
        child: Text(
          'מגלשות',
          style: TextStyle(fontSize: 15.0),
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.right,
        ),
      ),
      StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
        return Center(
          child: new Container(
            padding: EdgeInsets.only(right: 10.0, bottom: 10.0),
            height: 35,
            child: new CheckboxListTile(
                title: Text(
                  'מגלשה קטנה',
                  textDirection: TextDirection.rtl,
                ),
                value: _litSlide,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (bool value) {
                  setState(() {
                    _litSlide = value;
                  });
                }),
          ),
        );
      }),
      StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
        return Center(
          child: new Container(
            padding: EdgeInsets.all(10.0),
            child: new CheckboxListTile(
                title: Text(
                  'מגלשה גדולה',
                  textDirection: TextDirection.rtl,
                ),
                value: _bigSlide,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (bool value) {
                  setState(() {
                    _bigSlide = value;
                  });
                }),
          ),
        );
      }),
    ];
  }

  static Map<String, LatLng> coords = pgrounds.getCoords();
  static showMarkers() {
    List<Marker> markers = [];
    // markers = new List<Marker>();
    bool pgShimoni = _litSlide;
    bool pgMichvar = _bigSlide | _litSlide | _allSwing | _litSwing;
    bool pgPillbox = _litSlide | _allSwing;
    bool pgIndian = _litSlide;
    bool pgNayot = _bigSlide | _litSlide | _allSwing | _litSwing;
    bool pgGmordehay = _bigSlide | _litSlide | _allSwing | _litSwing;
    bool pgOnya = _bigSlide | _allSwing | _litSwing;
    bool pgPalmach = _allSwing;
    bool pgGonenim = _litSlide | _allSwing;
    List<bool> playgrounds = [
      pgShimoni,
      pgMichvar,
      pgPillbox,
      pgIndian,
      pgNayot,
      pgGmordehay,
      pgOnya,
      pgPalmach,
      pgGonenim
    ];

    // Load your custom marker icon image
    final BitmapDescriptor customMarkerIcon = BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(48, 48)),
      'assets/images/playground_icon.png',
    ) as BitmapDescriptor;

    for (int i = 0; i < coords.length; i++) {
      if (playgrounds[i]) {
        markers.add(
          new Marker(
              // width: 80.0,
              // height: 80.0,
              position: coords.values.elementAt(i),
              icon: customMarkerIcon,
              // builder: (ctx) => new FlatButton(
              // child: Image.asset('assets/images/playground_icon.png'),
              onTap: () {
                var context;
                showModalBottomSheet(
                    context: context,
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
                                      'גן הכדורים',
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
                                'מגרש משחקים',
                                textAlign: TextAlign.right,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(right: 20.0, bottom: 10.0),
                              child: Text(
                                'נדנדות לקטנטנים  |  נדנדות לגדולים  |  מגלשות קטנות  |  מגלשות גדולות',
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
