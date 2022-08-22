import 'dart:io';

class GeoLocation {
  final double? longitude;
  final double? latitude;
  final String? address;

  const GeoLocation({
    required this.longitude,
    required this.latitude,
    this.address,
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
