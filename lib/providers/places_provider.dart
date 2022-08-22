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

  Place getById(String id) {
    return _items.firstWhere((item) => item.id == id);
  }

  Future<void> addPlace(
    String title,
    File selectedImage,
    GeoLocation pickeLocation,
  ) async {
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
      image: selectedImage,
      title: title,
      location: updatedLocation,
    );
    _items.add(newPlace);
    DBHelper.insert('places', {
      'id': newPlace.id!,
      'title': newPlace.title!,
      'image': newPlace.image.path,
      'loc_lat': newPlace.location?.latitude as double,
      'loc_lng': newPlace.location?.longitude as double,
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
            location: GeoLocation(
                latitude: item['loc_lat'],
                longitude: item['loc_lng'],
                address: item['address']),
            image: File(item['image']),
          ),
        )
        .toList();
    notifyListeners();
  }
}
