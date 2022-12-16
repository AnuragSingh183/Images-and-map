import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:places/providers/great_places.dart';
import 'package:provider/provider.dart';

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
      body: Consumer<GreatPlaces>(
          child: Center(child: Text("No Place has been Add Yet")),
          builder: (context, greatPlaces, ch) => greatPlaces.items.length <= 0
              ? ch!
              : ListView.builder(
                  itemCount: greatPlaces.items.length,
                  itemBuilder: (ctx, i) => ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              FileImage(greatPlaces.items[i].image),
                        ),
                        title: Text(greatPlaces.items[i].title),
                        onTap: () {},
                      ))),
    );
  }
}
