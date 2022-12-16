// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {
  final Function onselectImage;
  ImageInput(this.onselectImage);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  Future _takePicture() async {
    final image = await ImagePicker()
        .pickImage(source: ImageSource.camera, maxWidth: 600);
    setState(() {
      _storedImage = File(image.toString());
    });

    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final filename = path.basename(image!.path);
    final savedImage = await File(image.path).copy('${appDir.path}/$filename');
    widget.onselectImage(
        savedImage); //will forward the savedimage in onselectimage and will be forwarded to picked image
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 200,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          child: _storedImage != null
              ? Image.file(
                  _storedImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : const Text(
                  "No image found",
                  textAlign: TextAlign.center,
                ),
          alignment: Alignment.center,
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
            child: FlatButton.icon(
                onPressed: _takePicture,
                icon: Icon(Icons.camera),
                label: Text("Take Photo")))
      ],
    );
  }
}
