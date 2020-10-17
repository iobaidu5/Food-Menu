import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodUI/database/db.dart';
import 'package:foodUI/utils/utility.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController amount = TextEditingController();
  DatabaseHelper _databaseHelper;
  Future<File> imageFile;
  Image image;
  String img;

  pickImageFromGallery() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.orange),
        title: Text("Add Data"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: new TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Name of Item"),
                  maxLines: 1,
                  controller: name,
                ),
              ),
              Expanded(
                child: new TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Quantity"),
                  maxLines: 1,
                  controller: quantity,
                ),
              ),
              Expanded(
                child: new TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Amount"),
                  maxLines: 1,
                  controller: amount,
                ),
              ),
              FlatButton(
                color: Colors.lightBlueAccent,
                padding: EdgeInsets.all(5.0),
                splashColor: Colors.blue[300],
                child: Text(
                  'Upload Image!',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () async {
                  await ImagePicker.pickImage(source: ImageSource.gallery)
                      .then((imgFile) {
                    img = Utility.base64String(imgFile.readAsBytesSync());
                  });
                },
              )
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new FlatButton(
                color: Colors.lightBlueAccent,
                padding: EdgeInsets.all(10.0),
                splashColor: Colors.blue[300],
                child: Text(
                  'Add Item!',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () async {
                  await _databaseHelper.insertImage(
                      name.text, quantity.text, amount.text, img);
                  print("Image Data uploaded");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
