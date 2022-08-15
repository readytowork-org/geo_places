import 'package:flutter/material.dart';
import 'package:geo_places/models/place.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final GeoLocation initialLocation;
  final bool isSelecting;

  MapScreen({
    this.initialLocation =
        const GeoLocation(latitude: 337.422131, longitude: -122.084801),
    this.isSelecting = false,
  });

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pick location"),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialLocation.latitude!,
            widget.initialLocation.longitude!,
          ),
          zoom: 16
        ),
      ),
    );
  }
}
