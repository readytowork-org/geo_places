import 'dart:io' show File;
import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({Key? key}) : super(key: key);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  late File? _storedImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          alignment: Alignment.center,
          child: _storedImage != null
              ? Image.file(_storedImage!)
              : const Text(
                  "No image taken",
                  textAlign: TextAlign.center,
                ),
        ),
        const SizedBox(
          height: 8,
        ),
        Expanded(
          child: TextButton.icon(
            onPressed: null,
            icon: const Icon(Icons.camera),
            label: const Text("Take picture"),
          ),
        )
      ],
    );
  }
}
