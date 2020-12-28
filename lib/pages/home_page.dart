import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File image;

  Future openGallery() async {
    var image = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      this.image = File(image.path);
    });
  }

  Future openCamera() async {
    var image = await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      this.image = File(image.path);
    });
  }

  Future<void> _openDialogBox() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Menu'),
            shape: RoundedRectangleBorder(),
            backgroundColor: Colors.blue,
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    onTap: openGallery,
                    child: Text(
                      'Open Gallery',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  GestureDetector(
                    onTap: openCamera,
                    child: Text(
                      'Open Camera',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Camera"),
      ),
      body: Container(
        child: image == null
            ? Center(
                child: Text("No Image"),
              )
            : Center(
                child: Image.file(image),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openDialogBox,
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
