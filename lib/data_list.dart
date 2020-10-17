import 'package:flutter/material.dart';
import 'package:foodUI/database/db.dart';

import './models/data.dart';

class DataList extends StatefulWidget {
  @override
  _DataList createState() => _DataList();
}

class _DataList extends State<DataList> {
  DatabaseHelper _query = new DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _query.getData(),
      initialData: List(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? new ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(10.0),
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

  Widget _buildRow(Data data) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(data.name),
        Text(data.number),
        Text(data.amount),
        Text(data.price),
      ],
    );
  }
}
