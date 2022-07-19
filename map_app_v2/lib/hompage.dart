import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart'; // Suitable for most situations
import 'package:flutter_map/plugin_api.dart'; // Only import if required functionality is not exposed by 'flutter_map.dart'
import 'package:latlong2/latlong.dart'; // Recommended for most use-cases

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Marker> _locations;

  _generateMarkers() {
    var points = [
      LatLng(51, 6.961899),
      LatLng(51.1, 6.961898),
      LatLng(51.2, 6.961897),
      LatLng(51.3, 6.961896),
      LatLng(51.4, 6.961895)
    ];

    for (var i = 0; i < points.length; i++) {
      _locations.add(Marker(
        width: 80.0,
        height: 80.0,
        point: points[i],
        builder: (ctx) => IconButton(
          onPressed: () {
            print("Marker tapped");
          },
          icon: const Icon(
            Icons.location_on,
            color: Colors.red,
          ),
          iconSize: 40.0,
        ),
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    _locations = <Marker>[];
    _generateMarkers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Leaflet Maps")),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center: LatLng(51, 6.961899),
              zoom: 10.0,
              maxZoom: 18.0,
              enableScrollWheel: true,
              scrollWheelVelocity: 0.0001,
            ),
            layers: [
              TileLayerOptions(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
                userAgentPackageName: 'com.map.app',
              ),
              MarkerLayerOptions(markers: _locations),
            ],
          ),
        ],
      ),
    );
  }
}
