import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import '../models/place.dart';
import 'dart:io';

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
    items.add(newPlace);
    notifyListeners();
  }
}
