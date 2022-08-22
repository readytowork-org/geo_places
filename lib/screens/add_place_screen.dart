import 'package:flutter/material.dart';
import '../../models/place.dart';
import "../../providers/places_provider.dart";
import '../../widget/image_input.dart';
import '../../widget/location_input.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = "/add-place";

  const AddPlaceScreen({Key? key}) : super(key: key);

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final titleController = TextEditingController();
  String _enteredText = '';
  File? _pickedImage;
  GeoLocation? _pickedLocation;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _selectPlace(double lat, double lng){
    _pickedLocation = GeoLocation(longitude: lng, latitude: lat);

  }

  void _savePlace() {
    if (titleController.text.isEmpty || _pickedImage == null || _pickedLocation == null) {
      return;
    }
    Provider.of<PlaceProvider>(context, listen: false).addPlace(
      titleController.text,
      _pickedImage!,
      _pickedLocation!
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Places'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          _enteredText = value;
                        });
                      },
                      controller: titleController,
                      decoration: InputDecoration(
                          labelText: "Title",
                          counterText:
                              '${_enteredText.length.toString()} character(s)'),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    ImageInput(_selectImage),
                    const SizedBox(height: 10,),
                    LocationInput(_selectPlace),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: _savePlace,
            icon: const Icon(Icons.add),
            label: const Text('Add'),
            style: ElevatedButton.styleFrom(
                elevation: 0,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                primary: Theme.of(context).colorScheme.secondary),
          )
        ],
      ),
    );
  }
}
