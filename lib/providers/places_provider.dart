import 'dart:io';
import 'package:flutter/foundation.dart';
import '../models/place.dart';
import '../helpers/db_helper.dart';

class PlaceProvider with ChangeNotifier {
  late List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String title, File selectedImage) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      title: title,
      location: null,
      image: selectedImage,
    );
    _items.add(newPlace);


    DBHelper.insert('places', {
      'id': newPlace.id!,
      'title': newPlace.title!,
      'image': newPlace.image,
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
