// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../widgets/image.dart';

class AddPlaces extends StatefulWidget {
  static const routename = "/addplace";
  const AddPlaces({Key? key}) : super(key: key);

  @override
  State<AddPlaces> createState() => _AddPlacesState();
}

class _AddPlacesState extends State<AddPlaces> {
  final TextEditingController _title = TextEditingController();
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
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ImageInput()
                ],
              ),
            ),
          )),
          RaisedButton(
            onPressed: () {},
            child: Text("Add Place"),
          )
        ],
      ),
    );
  }
}
