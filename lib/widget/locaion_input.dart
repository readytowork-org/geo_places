import 'package:flutter/material.dart';
import '../helpers/location_helper.dart';
import "package:location/location.dart";

class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImage;

   Future<void> _getCurrentLocation() async{
    final cordinates = await Location().getLocation();
    final mapUrl = LocationHelper.generateLocationPreviewImage(latitude: cordinates.latitude!, longitude: cordinates.longitude!);
    setState(() {
      print(mapUrl);
      _previewImage = mapUrl;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
           alignment: Alignment.center,
          child: _previewImage == null
              ? const Text(
                  'No location chosen',
                  textAlign: TextAlign.center,
                )
              : Image.network(_previewImage!),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: _getCurrentLocation,
              icon: const Icon(Icons.location_on),
              label: const Text("Current location"),
            ),
            TextButton.icon(
              onPressed:  _getCurrentLocation,
              icon: const Icon(Icons.map),
              label: const Text("Select on map"),
            )
          ],
        )
      ],
    );
  }
}
