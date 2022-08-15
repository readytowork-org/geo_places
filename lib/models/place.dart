import 'dart:io';

class GeoLocation {
  final double? longitude;
  final double? latitude;
  final String? name;

  const GeoLocation({
    required this.longitude,
    required this.latitude,
    this.name,
  });
}

class Place {
  final String? id;
  final String? title;
  final GeoLocation? location;
  final File image;

  Place({
    required this.id,
    required this.title,
    required this.location,
    required this.image,
  });
}
