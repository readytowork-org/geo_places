import 'dart:io';
import 'package:flutter/foundation.dart';
import '../models/place.dart';


class PlaceProvider with ChangeNotifier {
  final List<Place> _items = [];

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
    notifyListeners();
  }
}
