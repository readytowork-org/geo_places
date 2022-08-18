import 'package:flutter/material.dart';
import 'package:geo_places/models/place.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final GeoLocation initialLocation;
  final bool isSelecting;

  MapScreen({
    this.initialLocation = const GeoLocation(
      latitude: 37.42796133580664,
      longitude: -122.085749655962,
    ),
    this.isSelecting = false,
  });

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedLocation;

  void _selectLocation(LatLng position) {
    setState(() {
      _pickedLocation = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pick location"),
        actions: <Widget>[
          if (widget.isSelecting)
            IconButton(
                onPressed: _pickedLocation == null
                    ? null
                    : () {
                        Navigator.of(context).pop(_pickedLocation);
                      },
                icon: const Icon(Icons.check))
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialLocation.latitude!,
            widget.initialLocation.longitude!,
          ),
          zoom: 14,
        ),
        onTap: widget.isSelecting ? _selectLocation : null,
        markers: _pickedLocation == null
            ? <Marker>{}
            : {
                Marker(
                  markerId: const MarkerId('m1'),
                  position: _pickedLocation ??
                      LatLng(
                        widget.initialLocation.latitude!,
                        widget.initialLocation.longitude!,
                      ),
                ),
              },
      ),
    );
  }
}
