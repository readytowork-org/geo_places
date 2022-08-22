import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import '../screens/add_place_screen.dart';
import './add_place_screen.dart';
import './place_detail_screen.dart';
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
      body: FutureBuilder(
        future: Provider.of<PlaceProvider>(context, listen: false)
            .fetchAndsetPlaces(),
        builder: (ctx, snapShot) => snapShot.connectionState ==
                ConnectionState.waiting
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<PlaceProvider>(
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
                          subtitle: Text(
                              places.items[i].location!.address.toString()),
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              PlaceDetailScreen.routeName,
                              arguments: places.items[i].id,
                            );
                          },
                        ),
                        itemCount: places.items.length,
                      ),
              ),
      ),
    );
  }
}
