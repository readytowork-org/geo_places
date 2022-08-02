import 'package:flutter/material.dart';
import "../providers/places_provider.dart";
import '../widget/image_input.dart';
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

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace() {
    if (titleController.text.isEmpty || _pickedImage == null) {
      return;
    }
    Provider.of<PlaceProvider>(context, listen: false).addPlace(
      titleController.text,
      _pickedImage!,
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
                    ImageInput(_selectImage)
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
