import 'package:flutter/material.dart';
// import 'dart:async';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong/latlong.dart';
// import 'category.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'playgrounds.dart';

void main() {
  runApp(new MaterialApp(
    home: new TheApp(),
    debugShowCheckedModeBanner: false,
    localizationsDelegates: [
      GlobalCupertinoLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: [
      Locale("he", "IL"),
    ],
    locale: Locale("he", "IL"),
  ));
}

class MyItem {
  bool isExpanded;
  final String header;
  final Widget body;
  final Image image;

  MyItem(this.isExpanded, this.header, this.body, this.image);
}

class TheApp extends StatefulWidget {
  @override
  _TheAppState createState() => new _TheAppState();
}

class _TheAppState extends State<TheApp> {
  MapController mapController;
  Map<String, LatLng> coords;
  List<Marker> markers;
  List<MyItem> _items = new List<MyItem>();
  // List<MyItem> _items2 = new List<MyItem>();
  // bool _swing = false;
  // bool _slide = false;
  bool _zero6 = true;
  bool _six12 = true;
  bool _twelve18 = false;
  bool _eighteenUp = false;
  bool _one2 = true;
  bool _three4 = true;
  bool _five6 = false;
  bool _seven8 = false;
  bool _nineUp = false;
  bool _little = true;
  bool _oneYear = false;
  bool _threeYear = false;
  bool _fiveYear = false;
  bool _litSwing = true;
  bool _allSwing = false;
  bool _litSlide = true;
  bool _bigSlide = false;

  @override
  void initState() {
    super.initState();
    mapController = new MapController();

    // Map<String, LatLng> pgcoords = getCoords();
    coords = new Map<String, LatLng>();

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

    for (String category in [
      'גני ילדים',
      'גני שעשועים',
      'רופאים',
      'טיפת חלב',
      'חנויות',
      'בייביסיטר',
      'יעוץ שינה',
      'יעוץ הנקה',
      'אירועים'
    ]) {
      _items.add(
        new MyItem(
            false,
            category,
            new Container(
              padding: new EdgeInsets.all(10.0),
              alignment: Alignment.centerRight,
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: (() {
                  switch (category) {
                    case 'גני ילדים':
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
                        StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                          return Center(
                              child: new Container(
                            height: 35,
                            child: new CheckboxListTile(
                                title: Text(
                                  'מ- 3 חודשים עד שנה',
                                  textDirection: TextDirection.rtl,
                                ),
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: _little,
                                onChanged: (bool value) {
                                  setState(() {
                                    _little = value;
                                  });
                                }),
                          ));
                        }),
                        StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                          return Center(
                              child: new Container(
                            height: 35,
                            child: new CheckboxListTile(
                                title: Text(
                                  'שנה עד שלוש',
                                  textDirection: TextDirection.rtl,
                                ),
                                value: _oneYear,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                onChanged: (bool value) {
                                  setState(() {
                                    _oneYear = value;
                                  });
                                }),
                          ));
                        }),
                        StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                          return Center(
                              child: new Container(
                            height: 35,
                            child: new CheckboxListTile(
                                title: Text(
                                  'שלוש עד חמש',
                                  textDirection: TextDirection.rtl,
                                ),
                                value: _threeYear,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                onChanged: (bool value) {
                                  setState(() {
                                    _threeYear = value;
                                  });
                                }),
                          ));
                        }),
                        StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                          return Center(
                            // child: new Container(height: 35,
                            child: new CheckboxListTile(
                                title: Text(
                                  'חמש עד שש',
                                  textDirection: TextDirection.rtl,
                                ),
                                value: _fiveYear,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
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
                        StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                          return Center(
                              child: new Container(
                            height: 35,
                            child: new CheckboxListTile(
                                title: Text(
                                  'עד 6 ילדים',
                                  textDirection: TextDirection.rtl,
                                ),
                                value: _zero6,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                onChanged: (bool value) {
                                  setState(() {
                                    _zero6 = value;
                                  });
                                }),
                          ));
                        }),
                        StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                          return Center(
                              child: new Container(
                            height: 35,
                            child: new CheckboxListTile(
                                title: Text(
                                  'מ 6 - 12 ילדים',
                                  textDirection: TextDirection.rtl,
                                ),
                                value: _six12,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                onChanged: (bool value) {
                                  setState(() {
                                    _six12 = value;
                                  });
                                }),
                          ));
                        }),
                        StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                          return Center(
                              child: new Container(
                            height: 35,
                            child: new CheckboxListTile(
                                title: Text(
                                  'מ 12 עד 18 ילדים',
                                  textDirection: TextDirection.rtl,
                                ),
                                value: _twelve18,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                onChanged: (bool value) {
                                  setState(() {
                                    _twelve18 = value;
                                  });
                                }),
                          ));
                        }),
                        StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                          return Center(
                            // child: new Container(height: 35,
                            child: new CheckboxListTile(
                                title: Text(
                                  'מעל 18 ילדים',
                                  textDirection: TextDirection.rtl,
                                ),
                                value: _eighteenUp,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
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
                        StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                          return Center(
                            child: new Container(
                              height: 35,
                              child: new CheckboxListTile(
                                  title: Text(
                                    '1 - 2',
                                    textDirection: TextDirection.rtl,
                                  ),
                                  value: _one2,
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  onChanged: (bool value) {
                                    setState(() {
                                      _one2 = value;
                                    });
                                  }),
                            ),
                          );
                        }),
                        StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                          return Center(
                              child: new Container(
                            height: 35,
                            child: new CheckboxListTile(
                                title: Text(
                                  '3 - 4',
                                  textDirection: TextDirection.rtl,
                                ),
                                value: _three4,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                onChanged: (bool value) {
                                  setState(() {
                                    _three4 = value;
                                  });
                                }),
                          ));
                        }),
                        StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                          return Center(
                              child: new Container(
                            height: 35,
                            child: new CheckboxListTile(
                                title: Text(
                                  '5 - 6',
                                  textDirection: TextDirection.rtl,
                                ),
                                value: _five6,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                onChanged: (bool value) {
                                  setState(() {
                                    _five6 = value;
                                  });
                                }),
                          ));
                        }),
                        StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                          return Center(
                              child: new Container(
                            height: 35,
                            child: new CheckboxListTile(
                                title: Text(
                                  '7 - 8',
                                  textDirection: TextDirection.rtl,
                                ),
                                value: _seven8,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                onChanged: (bool value) {
                                  setState(() {
                                    _seven8 = value;
                                  });
                                }),
                          ));
                        }),
                        StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                          return Center(
                            // child: new Container(height: 35,
                            child: new CheckboxListTile(
                                title: Text(
                                  '9 +',
                                  textDirection: TextDirection.rtl,
                                ),
                                value: _nineUp,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                onChanged: (bool value) {
                                  setState(() => _nineUp = value);
                                }),
                          );
                        }),
                      ];
                    case 'גני שעשועים':
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
                        StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
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
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  onChanged: (bool value) {
                                    setState(() {
                                      _litSwing = value;
                                    });
                                    print('change litSwing');
                                  }),
                            ),
                          );
                        }),
                        StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
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
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
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
                        StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                          return Center(
                            child: new Container(
                              padding:
                                  EdgeInsets.only(right: 10.0, bottom: 10.0),
                              height: 35,
                              child: new CheckboxListTile(
                                  title: Text(
                                    'מגלשה קטנה',
                                    textDirection: TextDirection.rtl,
                                  ),
                                  value: _litSlide,
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  onChanged: (bool value) {
                                    setState(() {
                                      _litSlide = value;
                                    });
                                  }),
                            ),
                          );
                        }),
                        StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                          return Center(
                            child: new Container(
                              padding: EdgeInsets.all(10.0),
                              child: new CheckboxListTile(
                                  title: Text(
                                    'מגלשה גדולה',
                                    textDirection: TextDirection.rtl,
                                  ),
                                  value: _bigSlide,
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  onChanged: (bool value) {
                                    setState(() {
                                      _bigSlide = value;
                                    });
                                  }),
                            ),
                          );
                        }),
                      ];
                    case 'רופאים':
                      return [
                        new Container(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            'מתקנים',
                            style: TextStyle(fontSize: 15.0),
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                          ),
                        ),
                        StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                          return Center(
                              child: new Container(
                                  height: 35, child: Text('רופאים')));
                        })
                      ];
                    case 'טיפת חלב':
                      return [
                        new Container(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            'מתקנים',
                            style: TextStyle(fontSize: 15.0),
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                          ),
                        ),
                        StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                          return Center(
                              child: new Container(
                                  height: 35, child: Text('טיפת חלב')));
                        })
                      ];
                    case 'חנויות':
                      return [
                        new Container(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            'מתקנים',
                            style: TextStyle(fontSize: 15.0),
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                          ),
                        ),
                        StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                          return Center(
                              child: new Container(
                                  height: 35, child: Text('חנויות')));
                        })
                      ];
                    case 'בייביסיטר':
                      return [
                        new Container(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            'מתקנים',
                            style: TextStyle(fontSize: 15.0),
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                          ),
                        ),
                        StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                          return Center(
                              child: new Container(
                                  height: 35, child: Text('בייביסיטר')));
                        })
                      ];
                    case 'יעוץ שינה':
                      return [
                        new Container(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            'מתקנים',
                            style: TextStyle(fontSize: 15.0),
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                          ),
                        ),
                        StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                          return Center(
                              child: new Container(
                                  height: 35, child: Text('יעוץ שינה')));
                        })
                      ];
                    case 'יעוץ הנקה':
                      return [
                        new Container(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            'מתקנים',
                            style: TextStyle(fontSize: 15.0),
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                          ),
                        ),
                        StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                          return Center(
                              child: new Container(
                                  height: 35, child: Text('יעוץ הנקה')));
                        })
                      ];
                    case 'אירועים':
                      return [
                        new Container(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            'מתקנים',
                            style: TextStyle(fontSize: 15.0),
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                          ),
                        ),
                        StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                          return Center(
                              child: new Container(
                                  height: 35, child: Text('אירועים')));
                        })
                      ];
                  }
                }()),
              ),
            ),
            (() {
              switch (category) {
                case 'גני ילדים':
                  return Image(
                    image: AssetImage('assets/images/kindergarten_circle.png'),
                  );
                case 'גני שעשועים':
                  return Image(
                    image: AssetImage('assets/images/playground_circle.png'),
                  );
                case 'רופאים':
                  return Image(
                    image: AssetImage('assets/images/doctor_circle.png'),
                  );
                case 'חנויות':
                  return Image(
                    image: AssetImage('assets/images/shops_circle.png'),
                  );
                case 'טיפת חלב':
                  return Image(
                    image: AssetImage('assets/images/milk_drop_circle.png'),
                  );
                case 'יעוץ שינה':
                  return Image(
                    image: AssetImage('assets/images/sleep_circle.png'),
                  );
                case 'יעוץ הנקה':
                  return Image(
                    image: AssetImage('assets/images/breathfeed_circle.png'),
                  );
                case 'בייביסיטר':
                  return Image(
                    image: AssetImage('assets/images/babysitter_circle.png'),
                  );
                case 'אירועים':
                  return Image(
                    image: AssetImage('assets/images/calender_circle.png'),
                  );
              }
            }())),
      );
    }

    _showMarkers(false, false, false, false);
  }

  void _showMarkers(
      bool litSlide, bool bigSlide, bool litSwing, bool allSwing) {
    markers = new List<Marker>();
    bool pgShimoni = litSlide;
    bool pgMichvar = bigSlide | litSlide | allSwing | litSwing;
    bool pgPillbox = litSlide | allSwing;
    bool pgIndian = litSlide;
    bool pgNayot = bigSlide | litSlide | allSwing | litSwing;
    bool pgGmordehay = bigSlide | litSlide | allSwing | litSwing;
    bool pgOnya = bigSlide | allSwing | litSwing;
    bool pgPalmach = allSwing;
    bool pgGonenim = litSlide | allSwing;
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
    for (int i = 0; i < coords.length; i++) {
      if (playgrounds[i]) {
        markers.add(new Marker(
          width: 80.0,
          height: 80.0,
          point: coords.values.elementAt(i),
          builder: (ctx) => new FlatButton(
              child: Image.asset('assets/images/playground_icon.png'),
              onPressed: () {
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
                // print('marker tapped');
              }),
        ));
      }
    }
  }

  ExpansionPanel _createitem(MyItem item) {
    return new ExpansionPanel(
        headerBuilder: (
          BuildContext context,
          bool isExpanded,
        ) {
          return new ListTile(
            leading: item.image,
            // leading: Icon(Icons.arrow_back_ios_rounded),
            // padding: new EdgeInsets.all(5.0),
            title: new Text(
              item.header,
              style: TextStyle(fontSize: 20.0),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
            ),
            // alignment: Alignment.centerRight,
          );
        },
        body: item.body,
        isExpanded: item.isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.transparent,
            appBar: new AppBar(
              backgroundColor: Colors.transparent,
              title: new Container(
                height: 35,
                child: new TextField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: new InputDecoration(
                      hintText: 'חפשי בשכונה',
                      contentPadding: EdgeInsets.all(0.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(30.0),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xFFC1AAF2),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color(0xFFC1AAF2),
                      ),
                      // border: new OutlineInputBorder(
                      // borderRadius: const BorderRadius.all(
                      // const Radius.circular(30.0),
                      // ),
                      // borderSide: const BorderSide(color:  Color(0xFFC1AAF2),)
                      // ),
                      filled: true,
                      hintStyle: new TextStyle(
                          fontSize: 12.0, color: Colors.grey[600]),
                      fillColor: Colors.white70),
                ),
              ),
              elevation: 0.0,
              leading: Builder(
                builder: (context) => IconButton(
                  icon: Image(
                    image: AssetImage('assets/images/round_icon_button.png'),
                  ),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
            ),
            drawer: new Drawer(
              child: new Container(
                padding: new EdgeInsets.all(2.0),
                child: new ListView(
                  children: <Widget>[
                    // DrawerHeader(child: Text('נקודות עניין')),
                    new ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          _items[index].isExpanded = !_items[index].isExpanded;
                        });
                      },
                      children: _items.map(_createitem).toList(),
                    ),

                    new FlatButton(
                      onPressed: () {
                        setState(() {
                          _showMarkers(
                              _litSlide, _bigSlide, _litSwing, _allSwing);
                        });
                        Navigator.pop(context);
                      },
                      child: new Text('סגור'),
                    ),
                    // new Category()
                  ],
                ),
              ),
            ),
            body: new Container(
              padding: new EdgeInsets.all(0.0),
              child: new Center(
                child: new Column(
                  children: <Widget>[
                    new Flexible(
                        child: new FlutterMap(
                            mapController: mapController,
                            options: new MapOptions(
                                center: new LatLng(31.76334, 35.20203),
                                zoom: 15.0),
                            layers: [
                          new TileLayerOptions(
                              urlTemplate:
                                  "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                              subdomains: ['a', 'b', 'c']),
                          new MarkerLayerOptions(markers: markers),
                        ]))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
