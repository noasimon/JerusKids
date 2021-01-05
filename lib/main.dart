import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong/latlong.dart';

void main() {
  runApp(new MaterialApp(
    home: new TheApp()
  ));
}
class MyItem {
  bool isExpanded;
  final String header;
  final Widget body;

  MyItem(this.isExpanded, this.header, this.body);
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
  List<MyItem> _items2 = new List<MyItem>();
  bool _swing = false;
  bool _slide = false;
  bool _zero6 = false;
  bool _six12 = false;
  bool _twelve18 = false;
  bool _eighteenUp = false;
  bool _one2 = false;
  bool _three4 = false;
  bool _five6 = false;
  bool _seven8 = false;
  bool _nineUp = false;
  bool _little = false;
  bool _oneYear = false;
  bool _threeYear = false;
  bool _fiveYear = false;
  bool _litSwing = false;
  bool _allSwing = false;

  void _swingChanged(bool value) => setState(() => _swing = value);
  
  @override
  void initState(){
    super.initState();
    mapController = new MapController();
    coords = new Map<String, LatLng>();
    
    coords.putIfAbsent("Playground1", () => new LatLng(31.763725, 35.202158));
    coords.putIfAbsent("Playground2", () => new LatLng(31.756790, 35.203533));
    coords.putIfAbsent("Playground3", () => new LatLng(31.769325, 35.209223));
    
    for (String category in ['גני ילדים','גני שעשועים']) {
       _items.add(new MyItem(
                      false,
                      category,
                      new Container(
                        padding: new EdgeInsets.all(10.0),
                        child: 
                        new Column(
                          children: 
                          ((){
                            switch (category) {
                              case 'גני ילדים':
                              return [
                                new Text('גילאים', style: TextStyle(fontSize: 20.0)),
                                StatefulBuilder(
                                  builder: (BuildContext context, StateSetter setState) {
                                    return Center(
                                      child: new CheckboxListTile (
                                  title: Text('מ- 3 חודשים עד שנה'),
                                  value: _little, 
                                  onChanged: (bool value) {
                                    setState((){
                                      _little = value;
                                    });

                                  }),);}),
                                  StatefulBuilder(
                                  builder: (BuildContext context, StateSetter setState) {
                                    return Center(
                                      child: new CheckboxListTile (
                                  title: Text('שנה עד שלוש'),
                                  value: _oneYear, 
                                  onChanged: (bool value) {
                                    setState((){
                                      _oneYear = value;
                                    });

                                  }),);}),
                                  StatefulBuilder(
                                  builder: (BuildContext context, StateSetter setState) {
                                    return Center(
                                      child: new CheckboxListTile (
                                  title: Text('שלוש עד חמש'),
                                  value: _threeYear, 
                                  onChanged: (bool value) {
                                    setState((){
                                      _threeYear = value;
                                    });

                                  }),);}),
                                  StatefulBuilder(
                                  builder: (BuildContext context, StateSetter setState) {
                                    return Center(
                                      child: new CheckboxListTile (
                                  title: Text('חמש עד שש'),
                                  value: _fiveYear, 
                                  onChanged: (bool value) {
                                    setState((){
                                      _fiveYear = value;
                                    });

                                  }),);}),

                                new Text('מספר ילדים', style: TextStyle(fontSize: 20.0)),
                                
                                StatefulBuilder(
                                  builder: (BuildContext context, StateSetter setState) {
                                    return Center(
                                      child: new CheckboxListTile (
                                  title: Text('עד 6 ילדים'),
                                  value: _zero6, 
                                  onChanged: (bool value) {
                                    setState((){
                                      _zero6 = value;
                                    });

                                  }),
                                  );}),
                                  StatefulBuilder(
                                  builder: (BuildContext context, StateSetter setState) {
                                    return Center(
                                      child: new CheckboxListTile(
                                  title: Text('מ 6 - 12 ילדים'),
                                  value: _six12, 
                                  onChanged: (bool value) {
                                    setState((){
                                      _six12 = value;
                                    });
                                    
                                  }),
                                  );}),
                                  StatefulBuilder(
                                  builder: (BuildContext context, StateSetter setState) {
                                    return Center(
                                      child: new CheckboxListTile (
                                  title: Text('מ 12 עד 18 ילדים'),
                                  value: _twelve18, 
                                  onChanged: (bool value) {
                                    setState((){
                                      _twelve18 = value;
                                    });

                                  }),
                                  );}),
                                  StatefulBuilder(
                                  builder: (BuildContext context, StateSetter setState) {
                                    return Center(
                                      child: new CheckboxListTile (
                                  title: Text('מעל 18 ילדים'),
                                  value: _eighteenUp, 
                                  onChanged: (bool value) {
                                    setState((){
                                      _eighteenUp = value;
                                    });

                                  }),
                                  );}),
                                  new Text('מספר ילדים למטפלת', style: TextStyle(fontSize: 20.0)),
                                  StatefulBuilder(
                                  builder: (BuildContext context, StateSetter setState) {
                                    return Center(
                                      child: new CheckboxListTile (
                                        title: Text('1 - 2'),
                                        value: _one2, 
                                        onChanged: (bool value) {
                                          setState((){
                                            _one2 = value;
                                          });

                                        }
                                      ),
                                    );
                                  }),
                                  StatefulBuilder(
                                  builder: (BuildContext context, StateSetter setState) {
                                    return Center(
                                      child: new CheckboxListTile (
                                  title: Text('3 - 4'),
                                  value: _three4, 
                                  onChanged: (bool value) {
                                    setState((){
                                      _three4 = value;
                                    });

                                  }),
                                  );}),
                                  StatefulBuilder(
                                  builder: (BuildContext context, StateSetter setState) {
                                    return Center(
                                      child: new CheckboxListTile (
                                  title: Text('5 - 6'),
                                  value: _five6, 
                                  onChanged: (bool value) {
                                    setState((){
                                      _five6 = value;
                                    });
                                  }),
                                  );}),
                                  StatefulBuilder(
                                  builder: (BuildContext context, StateSetter setState) {
                                    return Center(
                                      child: new CheckboxListTile (
                                  title: Text('7 - 8'),
                                  value: _seven8, 
                                  onChanged: (bool value) {
                                    setState((){
                                      _seven8 = value;
                                    });
                                  }),
                                  );}),
                                  StatefulBuilder(
                                  builder: (BuildContext context, StateSetter setState) {
                                    return Center(
                                      child: new CheckboxListTile (
                                  title: Text('9 +'),
                                  value: _nineUp, 
                                  onChanged: (bool value) {
                                    setState(() => _nineUp = value);

                                  }),);}),
                                  ];
                              case 'גני שעשועים':
                              return [
                                new Text('מתקנים', style: TextStyle(fontSize: 20.0)),
                                StatefulBuilder(
                                  builder: (BuildContext context, StateSetter setState) {
                                    return Center(
                                      child: new CheckboxListTile(
                                  title: Text('נדנדה'),
                                  value: _swing, 
                                  onChanged: 
                                  (bool value) {
                                    setState((){
                                      _swing = value;
                                    }
                                  );

                                  }
                                  ),
                                  );}),
                                  StatefulBuilder(
                                  builder: (BuildContext context, StateSetter setState) {
                                    return Center(
                                      child: new CheckboxListTile(
                                  title: Text('מגלשה'),
                                  value: _slide, 
                                  onChanged: (bool value) {
                                    setState((){
                                      _slide = value;
                                    });
                                    
                                  }),);}),];
                            }}()),
                        ),
                      ),
                      ),
                    );
    }

    _showMarkers(_slide, _swing);

  }
  void _showMarkers(bool slide, bool swing){
    markers = new List<Marker>();
    bool playground1 = slide;
    bool playground2 = slide | swing;
    bool playground3 = slide | swing;
    List<bool> playgrounds = [playground1, playground2, playground3];
    for(int i = 0; i< coords.length; i++){
      if (playgrounds[i]){
      markers.add(
        new Marker(
          width: 80.0,
          height: 80.0,
          point: coords.values.elementAt(i),
          builder: (ctx) => new Icon(Icons.pin_drop, color: Colors.orange,),
        )
      );};
    }
  }

  ExpansionPanel _createitem(MyItem item){
    return new ExpansionPanel(
      headerBuilder: (BuildContext context, bool isExpanded){
        return new Container(
          padding: new EdgeInsets.all(5.0),
          child: new Text(item.header),

        );
      },
      body: item.body,
      isExpanded: item.isExpanded

    );
  }

  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
        appBar: new AppBar(
          title: Text('JerusKids'),
        ), 
        endDrawer: new Drawer(
          child: new Container(
            padding: new EdgeInsets.all(32.0),
            child: new ListView (
              children: <Widget>[
                new ExpansionPanelList(
                  expansionCallback: (int index, bool isExpanded) {
                    setState(() {
                      _items[index].isExpanded = !_items[index].isExpanded;
                    });
                  },
                  children: _items.map(_createitem).toList(),
                   ),
                
                new FlatButton(onPressed: () {
                  setState(() {_showMarkers(_slide, _swing);});
                  Navigator.pop(context); },
                  child: new Text('סגור'),
                
                )

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
                      zoom: 15.0
                    ),
                    layers: [
                      new TileLayerOptions(
                        urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: ['a', 'b', 'c']
                      ),
                      new MarkerLayerOptions(markers: markers),

                    ]
                  ))
          ],),),
      ),
    );
  }
}
