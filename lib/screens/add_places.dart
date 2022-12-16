// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../widgets/image.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import '../providers/great_places.dart';

class AddPlaces extends StatefulWidget {
  static const routename = "/addplace";
  const AddPlaces({Key? key}) : super(key: key);

  @override
  State<AddPlaces> createState() => _AddPlacesState();
}

class _AddPlacesState extends State<AddPlaces> {
  final TextEditingController _title = TextEditingController();
  File? _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace() {
    if (_title.text.isEmpty || _pickedImage == null) {
      return;
    }
    Provider.of<GreatPlaces>(context, listen: false)
        .addPlace(_title.text, _pickedImage!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new destination"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    controller: _title,
                    decoration:
                        InputDecoration(label: Text("title of the place")),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ImageInput(_selectImage)
                ],
              ),
            ),
          )),
          RaisedButton(
            onPressed: _savePlace,
            child: const Text("Add Place"),
          )
        ],
      ),
    );
  }
}
