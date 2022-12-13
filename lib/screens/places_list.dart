import 'package:flutter/material.dart';

class Placeslist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PlaceList"),
        actions: [
          IconButton(
              color: Colors.red,
              onPressed: () {
                Navigator.of(context).pushNamed("/addplace");
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: CircularProgressIndicator(),
    );
  }
}
