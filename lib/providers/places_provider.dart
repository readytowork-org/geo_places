import 'dart:io';
import 'package:flutter/foundation.dart';
import '../models/place.dart';
import '../helpers/db_helper.dart';
import '../helpers/location_helper.dart';

class PlaceProvider with ChangeNotifier {
  late List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  Future<void> addPlace(
      String title, File selectedImage, GeoLocation pickeLocation) async {

    final address = await LocationHelper.getPlaceAddress(
      pickeLocation.latitude as double,
      pickeLocation.longitude as double,
    ); 

    final updatedLocation = GeoLocation(
      longitude: pickeLocation.longitude,
      latitude: pickeLocation.latitude,
      address: address,
    );

    final newPlace = Place(
      id: DateTime.now().toString(),
      title: title,
      location: updatedLocation,
      image: selectedImage,
    );
    _items.add(newPlace);

    DBHelper.insert('places', {
      'id': newPlace.id!,
      'title': newPlace.title!,
      'image': newPlace.image,
      'loc_lat': newPlace.location?.latitude as double,
      'loc_lng':  newPlace.location?.longitude as double,
      'address': newPlace.location?.address as String,
    });
    notifyListeners();
  }

  Future<void> fetchAndsetPlaces() async {
    final dataList = await DBHelper.getData('places');

    _items = dataList
        .map(
          (item) => Place(
            id: item['id'],
            title: item['title'],
            location: null,
            image: File(item['image']),
          ),
        )
        .toList();
    notifyListeners();
  }
}
