import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TextRecognizer extends StatefulWidget {
  const TextRecognizer({Key key}) : super(key: key);

  @override
  _TextRecognizerState createState() => _TextRecognizerState();
}

class _TextRecognizerState extends State<TextRecognizer> {
  File _image;
  bool isImageLoaded = false;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      isImageLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            isImageLoaded
                ? Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: FileImage(_image), fit: BoxFit.fill),
                    ),
                  )
                : Container(
                    child: Text('image ....'),
                  ),
            RaisedButton(
              child: Text('find'),
              onPressed: getImage,
            )
          ],
        ),
      ),
    );
  }
}
