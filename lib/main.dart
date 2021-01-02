import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong/latlong.dart';

void main() {
  runApp(new MaterialApp(
    home: new TheApp()
  ));
}

class TheApp extends StatefulWidget {
  @override
  _TheAppState createState() => new _TheAppState();
}

class _TheAppState extends State<TheApp> {
  
  MapController mapController;
  Map<String, LatLng> coords;
  List<Marker> markers;

  @override
  void initState(){
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

  }

  void _showCoord(int index) {
    mapController.move(coords.values.elementAt(index), 18.0);
  }

  List<Widget> _makeButtons() {
    List<Widget> list = new List<Widget>();

    for(int i = 0; i< coords.length; i++){
      list.add(new RaisedButton(onPressed: () => _showCoord(i), child: new Text(coords.keys.elementAt(i)),));
    }
    return list;
  }


  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
        appBar: new AppBar(
          title: Text('My first app'),
        ), 
        body: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Row(
                  children: _makeButtons(),
                ),
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
