import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong/latlong.dart';
import 'package:nominatim_location_picker/nominatim_location_picker.dart';
// import 'package:search_map_place/search_map_place.dart';

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
  bool _swing = false;
  bool _slide = false;
  bool _zero6 = false;
  bool _six12 = false;
  void _swingChanged(bool value) => setState(() => _swing = value);
  
  @override
  void initState(){
    super.initState();
    mapController = new MapController();
    coords = new Map<String, LatLng>();
    
    coords.putIfAbsent("Playground1", () => new LatLng(31.763725, 35.202158));

    markers = new List<Marker>();

    for(int i = 0; i< coords.length; i++){
      markers.add(
        new Marker(
          width: 80.0,
          height: 80.0,
          point: coords.values.elementAt(i),
          builder: (ctx) => new Icon(Icons.pin_drop, color: Colors.orange,),
        )
      );
    }
    
    for (String category in ['גני ילדים','גני שעשועים']) {
       _items.add(new MyItem(
                      false,
                      category,
                      new Container(
                        padding: new EdgeInsets.all(10.0),
                        child: 
                        new Column(
                          // children: [
                            // new Text('expanded'),
                          // ],
                          children: 
                          ((){
                            switch (category) {
                              case 'גני ילדים':
                              return [
                                new Text('גני ילדים'),
                                new Text('מספר ילדים'),
                                
                                new CheckboxListTile (
                                  title: Text('עד 6 ילדים'),
                                  value: _zero6, 
                                  onChanged: (bool value) {
                                    setState((){
                                      _zero6 = value;
                                    });

                                  }),
                                  new CheckboxListTile(
                                  title: Text('מ 6 - 12 ילדים'),
                                  value: _six12, 
                                  onChanged: (bool value) {
                                    setState((){
                                      _six12 = value;
                                    });
                                    
                                  }),];
                                break;
                              case 'גני שעשועים':
                              return [
                                new Text('גני שעשועים'),
                                new Text('מתקנים'),
                                // bool _checked = false;
                                new CheckboxListTile(
                                  title: Text('נדנדה'),
                                  
                                  value: _swing, 
                                  onChanged: _swingChanged,
                                  // (bool value) {
                                  //   setState((){
                                  //     _swing = value;
                                  //   }
                                  // );

                                  // }
                                  ),
                                  new CheckboxListTile(
                                  title: Text('מגלשה'),
                                  value: _slide, 
                                  onChanged: (bool value) {
                                    setState((){
                                      _slide = value;
                                    });
                                    
                                  }),];
                                break;
                              default:
                            }}()),
                        ),
                      ),
                      ),
                    );
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

  // void _showCoord(int index) {
  //   mapController.move(coords.values.elementAt(index), 18.0);
  // }

  // List<Widget> _makeButtons() {
  //   List<Widget> list = new List<Widget>();

  //   for(int i = 0; i< coords.length; i++){
  //     list.add(new RaisedButton(onPressed: () => _showCoord(i), child: new Text(coords.keys.elementAt(i)),));
  //   }
  //   return list;
  // }


  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
        appBar: new AppBar(
          title: Text('JerusKids'),
        ), 
        endDrawer: new Drawer(
          child: new Container(
            padding: new EdgeInsets.all(32.0),
            child: new ListView(
              children: <Widget>[
                new ExpansionPanelList(
                  expansionCallback: (int index, bool isExpanded) {
                    setState(() {
                      _items[index].isExpanded = !_items[index].isExpanded;
                    });
                  },
                  children: _items.map(_createitem).toList(),
                   ),
                    // new Row(
                    //   children:
                    //     _makeButtons(),
                    // ),
                new FlatButton(onPressed: () => Navigator.pop(context), child: new Text('סגור'),)

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
