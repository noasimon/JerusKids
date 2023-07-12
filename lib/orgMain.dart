import 'dart:async';

import 'package:flutter/material.dart';
// import 'dart:async';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'playgrounds.dart';
import 'kindergartens.dart';

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
  Completer<GoogleMapController> mapController = Completer();
  CameraPosition _initialPosition =
      CameraPosition(target: LatLng(31.76334, 35.20203));

  void _onMapCreated(GoogleMapController controller) {
    mapController.complete(controller);
  }

  List<Marker> markers;
  List<Marker> markers1;
  List<MyItem> _items = []; //new List<MyItem>();
  // bool _zero6 = true;
  // bool _six12 = true;
  // bool _twelve18 = false;
  // bool _eighteenUp = false;
  // bool _one2 = true;
  // bool _three4 = true;
  // bool _five6 = false;
  // bool _seven8 = false;
  // bool _nineUp = false;
  // bool _little = true;
  // bool _oneYear = false;
  // bool _threeYear = false;
  // bool _fiveYear = false;
  @override
  void initState() {
    super.initState();
    var googleMap = GoogleMap(
        onMapCreated: _onMapCreated,
        // mapController: mapController,
        // options: new MapOptions(
        initialCameraPosition: _initialPosition);
    // mapController = new MapController();
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
                      return kindergarts.cbox();
                    case 'גני שעשועים':
                      return pgrounds.cbox();
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

    markers = pgrounds.showMarkers();
    markers1 = kindergarts.showMarkers();
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
      body: new Container(
        padding: new EdgeInsets.all(0.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Scaffold(
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
                        image:
                            AssetImage('assets/images/round_icon_button.png'),
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
                              _items[index].isExpanded =
                                  !_items[index].isExpanded;
                            });
                          },
                          children: _items.map(_createitem).toList(),
                        ),

                        new FlatButton(
                          onPressed: () {
                            setState(() {
                              markers = pgrounds.showMarkers();
                              markers1 = kindergarts.showMarkers();
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
                body: Stack(
                  // padding: new EdgeInsets.all(0.0),
                  // child: new Center(
                  // child: new Column(
                  children: <Widget>[
                    googleMap()
                    // zoom: 15.0),
                    // layers: [
                    // new TileLayerOptions(
                    //     urlTemplate:
                    //         "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    //     subdomains: ['a', 'b', 'c']),
                    // new MarkerLayerOptions(markers: markers),
                    // new MarkerLayerOptions(markers: markers1),
                    // ]
                  ],
                ),
              ),
              // ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
