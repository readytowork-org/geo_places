
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:geo_places/screens/add_place_screen.dart';
import "../../providers/places_provider.dart";
class PlacesScreen extends StatelessWidget {
  const PlacesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All locations"),
        actions: <Widget>[
          IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Consumer<PlaceProvider>(
        child: const Center(
          child: Text("No places added"),
        ),
        builder: (ctx, places, ch) => places.items.isEmpty
            ? ch as Widget
            : ListView.builder(
                itemBuilder: (_, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(places.items[i].image),
                  ),
                  title: Text(places.items[i].title!),
                  subtitle: const Text("Location name"),
                ),
                itemCount: places.items.length,
              ),
      ),
    );
  }
}
