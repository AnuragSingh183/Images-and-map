import 'package:flutter/material.dart';
import '../models/place.dart';
import 'dart:io';

class GreatPlaces with ChangeNotifier {
  final List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String placetitle, File pickedImage) {
    final newPlace = Place(
        id: DateTime.now().toString(), title: placetitle, image: pickedImage);
    _items.add(newPlace);
    notifyListeners();
  }
}
