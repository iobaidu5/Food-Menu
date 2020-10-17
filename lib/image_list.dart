import 'package:flutter/material.dart';
import 'package:foodUI/database/db.dart';
import 'package:foodUI/utils/utility.dart';
import 'models/image.dart';

class ImageList extends StatefulWidget {
  @override
  _ImageList createState() => _ImageList();
}

class _ImageList extends State<ImageList> {
  DatabaseHelper _query = new DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _query.getImages(),
      initialData: List(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? new GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                padding: const EdgeInsets.all(5.0),
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return _buildRow(snapshot.data[i]);
                },
              )
            : Center(
                child: Text("No Data"),
              );
      },
    );
  }

  Widget _buildRow(MyImage image) {
    var img = Utility.imageFromBase64String(image.url);
    return new Expanded(
      child: FlatButton(
        child: ListTile(
          leading: Image.asset(
            '$img',
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          title: Text(image.amount),
          subtitle: Text(image.quantity),
        ),
        onPressed: () {
          _query.insertData(image.name, 1, image.amount, image.quantity);
          print("Data Inserted");
        },
      ),
    );
  }
}
