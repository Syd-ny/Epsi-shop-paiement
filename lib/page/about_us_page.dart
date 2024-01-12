import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class AboutUsPage extends StatelessWidget {
  AboutUsPage({super.key});
  final mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>mapController.move(LatLng(46.827385, -0.137015),15),
        child: Icon(Icons.gps_fixed),
      ),
      body: FlutterMap(
        options: MapOptions(
            initialCenter: LatLng(46.827385, -0.137015)
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"),
          const MarkerLayer(
            markers: [
              Marker(child: Icon(Icons.school),point: LatLng(46.827385, -0.137015))
            ],
          ),
        ],

        mapController: mapController
      ),
    );
  }
}
