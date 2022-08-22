import 'package:flutter/material.dart';
import 'package:geo_places/models/place.dart';
import 'package:geo_places/screens/map_screen.dart';
import 'package:provider/provider.dart';
import '../../providers/places_provider.dart';

class PlaceDetailScreen extends StatelessWidget {
  static const routeName = "/place-detail";
  const PlaceDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments as String;
    final locationData =
        Provider.of<PlaceProvider>(context, listen: false).getById(id);

    return Scaffold(
      appBar: AppBar(
        title: Text(locationData.title!),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 250,
              width: double.infinity,
              child: Image.file(
                locationData.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              locationData.location!.address.toString(),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (ctx) => MapScreen(
                    initialLocation: locationData.location as GeoLocation,
                    isSelecting: false,
                  ),
                ));
              },
              child: const Text('View on map'),
            )
          ],
        ),
      ),
    );
  }
}
