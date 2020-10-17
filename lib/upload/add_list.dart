import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodUI/database/db.dart';

// ignore: must_be_immutable
class AddItem extends StatelessWidget {
  TextEditingController name = TextEditingController();
  DatabaseHelper _databaseHelper;

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
                      border: OutlineInputBorder(), labelText: "Add Item"),
                  maxLines: 1,
                  controller: name,
                ),
              ),
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
                  await _databaseHelper.insertItem(name.text);
                  print("Item uploaded");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
