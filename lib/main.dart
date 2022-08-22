import 'package:flutter/material.dart';
import 'package:geo_places/screens/map_screen.dart';
import 'package:geo_places/screens/place_detail_screen.dart';
import "package:provider/provider.dart";
/**Screens */
import "./screens//places_list_screen.dart";
import './screens/add_place_screen.dart';
/**Providers */
import "./providers/places_provider.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => PlaceProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch(primarySwatch: Colors.indigo).copyWith(
            secondary: Colors.amber, // Your accent color
          ),
        ),
        home: const PlacesScreen(),
        routes: {
          AddPlaceScreen.routeName: (ctx) => const AddPlaceScreen(),
          PlaceDetailScreen.routeName : (ctx) => const PlaceDetailScreen(),
        },
      ),
    );
  }
}
