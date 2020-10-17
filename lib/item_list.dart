import 'package:flutter/material.dart';
import 'package:foodUI/database/db.dart';

import 'models/item.dart';

class ItemList extends StatefulWidget {
  @override
  _ItemList createState() => _ItemList();
}

class _ItemList extends State<ItemList> {
  DatabaseHelper _query = new DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _query.getItems(),
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

  Widget _buildRow(Item newitem) {
    return new Center(child: Text('${newitem.item}'));
  }
}
