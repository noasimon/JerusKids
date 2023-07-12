import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Map App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  Set<Marker> _markers = {};

  // Filter options
  String? selectedField;
  String? selectedSwingOption;
  String? selectedSlideOption;
  String? selectedChildrenOption;
  String? selectedCaregiversOption;
  String? selectedAgesOption;

  // Marker details
  String? selectedMarkerTitle;
  String? selectedMarkerDescription;
  String? selectedMarkerImage;

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map App'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Kindergartens'),
              onTap: () {
                setState(() {
                  selectedField = 'kindergartens';
                });
                _showFiltersDialog();
              },
            ),
            ListTile(
              title: Text('Playgrounds'),
              onTap: () {
                setState(() {
                  selectedField = 'playgrounds';
                });
                _showFiltersDialog();
              },
            ),
          ],
        ),
      ),
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
        markers: _markers,
        initialCameraPosition: CameraPosition(
          target: LatLng(37.42796133580664, -122.085749655962),
          zoom: 15,
        ),
      ),
    );
  }

  Future<void> _showFiltersDialog() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Filters'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (selectedField == 'kindergartens') ...[
                Text('Number of Children:'),
                DropdownButton<String>(
                  value: selectedChildrenOption,
                  items: [
                    DropdownMenuItem<String>(
                      value: '1-6',
                      child: Text('1-6'),
                    ),
                    DropdownMenuItem<String>(
                      value: '6-12',
                      child: Text('6-12'),
                    ),
                    DropdownMenuItem<String>(
                      value: '12-18',
                      child: Text('12-18'),
                    ),
                    DropdownMenuItem<String>(
                      value: '18+',
                      child: Text('18+'),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedChildrenOption = value;
                    });
                  },
                ),
                Text('Number of Caregivers:'),
                DropdownButton<String>(
                  value: selectedCaregiversOption,
                  items: [
                    DropdownMenuItem<String>(
                      value: '1',
                      child: Text('1'),
                    ),
                    DropdownMenuItem<String>(
                      value: '2',
                      child: Text('2'),
                    ),
                    DropdownMenuItem<String>(
                      value: '3',
                      child: Text('3'),
                    ),
                    DropdownMenuItem<String>(
                      value: '4+',
                      child: Text('4+'),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedCaregiversOption = value;
                    });
                  },
                ),
                Text('Ages:'),
                DropdownButton<String>(
                  value: selectedAgesOption,
                  items: [
                    DropdownMenuItem<String>(
                      value: '3 months - 1 year',
                      child: Text('3 months - 1 year'),
                    ),
                    DropdownMenuItem<String>(
                      value: '1-2 years',
                      child: Text('1-2 years'),
                    ),
                    DropdownMenuItem<String>(
                      value: '2-3 years',
                      child: Text('2-3 years'),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedAgesOption = value;
                    });
                  },
                ),
              ],
              if (selectedField == 'playgrounds') ...[
                Text('Swings:'),
                DropdownButton<String>(
                  value: selectedSwingOption,
                  items: [
                    DropdownMenuItem<String>(
                      value: 'safety little kids swing',
                      child: Text('Safety Little Kids Swing'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'big kids swing',
                      child: Text('Big Kids Swing'),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedSwingOption = value;
                    });
                  },
                ),
                Text('Slides:'),
                DropdownButton<String>(
                  value: selectedSlideOption,
                  items: [
                    DropdownMenuItem<String>(
                      value: 'small slide',
                      child: Text('Small Slide'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'big slide',
                      child: Text('Big Slide'),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedSlideOption = value;
                    });
                  },
                ),
              ],
            ],
          ),
          actions: [
            TextButton(
              child: Text('Apply'),
              onPressed: () {
                _applyFilters();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _applyFilters() {
    // Here, you can fetch the relevant markers from a database based on the selected filters
    // For this example, let's assume we have some dummy data

    Set<Marker> newMarkers = {};

    // Dummy markers for testing
    if (selectedField == 'kindergartens') {
      newMarkers.add(
        Marker(
          markerId: MarkerId('1'),
          position: LatLng(37.42796133580664, -122.085749655962),
          onTap: () {
            _showMarkerDetails('Kindergarten 1', 'Description 1',
                'assets/images/gMordechay1.jpg');
          },
        ),
      );
      newMarkers.add(
        Marker(
          markerId: MarkerId('2'),
          position: LatLng(37.4219999, -122.0840575),
          onTap: () {
            _showMarkerDetails('Kindergarten 2', 'Description 2',
                'assets/images/gMordechay1.jpg');
          },
        ),
      );
    } else if (selectedField == 'playgrounds') {
      newMarkers.add(
        Marker(
          markerId: MarkerId('3'),
          position: LatLng(37.4219999, -122.0820575),
          onTap: () {
            _showMarkerDetails('Playground 1', 'Description 3',
                'assets/images/gMordechay1.jpg');
          },
        ),
      );
      newMarkers.add(
        Marker(
          markerId: MarkerId('4'),
          position: LatLng(37.4239999, -122.0830575),
          onTap: () {
            _showMarkerDetails('Playground 2', 'Description 4',
                'assets/images/gMordechay1.jpg');
          },
        ),
      );
    }

    setState(() {
      _markers = newMarkers;
    });
  }

  void _showMarkerDetails(String title, String description, String image) {
    setState(() {
      selectedMarkerTitle = title;
      selectedMarkerDescription = description;
      selectedMarkerImage = image;
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(selectedMarkerTitle!),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(selectedMarkerDescription!),
              SizedBox(height: 8.0),
              Image.asset(
                selectedMarkerImage!,
                width: 100,
                height: 100,
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
