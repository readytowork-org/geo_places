import 'package:flutter/material.dart';
import "package:location/location.dart";

class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? previewImage;

   Future<void> _getCurrentLocation() async{
    final location = await Location().getLocation();
    print(location.latitude);
    print(location.longitude);
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
          child: previewImage == null
              ? const Text(
                  'No location chosen',
                  textAlign: TextAlign.center,
                )
              : Image.network(previewImage!),
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
