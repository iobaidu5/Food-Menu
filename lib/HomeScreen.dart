import 'package:flutter/material.dart';
import 'package:foodUI/database/db.dart';
import 'package:foodUI/image_list.dart';
import 'package:foodUI/upload/add_list.dart';
import 'package:foodUI/upload/uploadImage.dart';
import 'package:toggle_switch/toggle_switch.dart';
import './models/data.dart';
import './data_list.dart';
import 'item_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<HomeScreen> {
  DatabaseHelper _query = new DatabaseHelper();
  var total;

  getCount() async {
    var count = await _query.getCount();
    if (count == null) {
      total = 0;
    } else {
      total = count;
      return total;
    }
  }

  @override
  void initState() {
    super.initState();
    getCount();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Container(
        // Overall
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(10.0),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Container(
                  width: screenWidth * 0.96,
                  height: screenHeight * 0.10,
                  // margin: EdgeInsets.(20.0),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          IconButton(
                              icon: Icon(Icons.arrow_left), onPressed: null),
                          IconButton(
                              icon: Icon(Icons.restaurant_menu),
                              onPressed: null),
                          IconButton(
                              icon: Icon(Icons.settings), onPressed: null),
                        ],
                      ),
                      Spacer(),
                      SizedBox(
                          width: 200,
                          child: Container(
                            height: screenHeight * 0.70,
                            width: screenWidth * 0.30,
                            decoration: BoxDecoration(
                              color: Colors.white10,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: Colors.grey[800],
                              ),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.search,
                                  color: Colors.orange,
                                ),
                                hintText: "Search Here",
                                hintStyle: TextStyle(color: Colors.white60),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ], //Row Children
            ),
            //Side Column
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      // padding: EdgeInsets.all(5.0),
                      height: screenHeight * 0.72,
                      width: screenWidth * 0.32,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[800],
                          width: 1.0,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "No.",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Price",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Amount",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 5.0),
                                child: Expanded(child: DataList()),
                              ),
                            ],
                          ),
                        ],
                      ),
                      //color: Colors.red,
                    ),
                  ],
                ),
                SizedBox(width: 8),
                Stack(
                  children: [
                    Container(
                      height: screenHeight * 0.72,
                      width: screenWidth * 0.53,
                      child: Container(
                        margin: EdgeInsets.only(
                            top: 10.0, left: 3.0, right: 3.0, bottom: 10.0),
                        child: ImageList(),
                      ),
                    ),
                    FlatButton(
                      color: Colors.deepOrange,
                      child: Text(
                        "Add Image +",
                        style: TextStyle(fontSize: 20.0),
                      ),
                      onPressed: () async {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => UploadImage()));
                      },
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      height: screenHeight * 0.72,
                      width: screenWidth * 0.10,
                    
                      child: Container(
                        child: ItemList(),
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      child: RaisedButton(
                        color: Colors.deepOrange,
                        child: Text(
                          "Add",
                        ),
                        onPressed: () async {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AddItem()));
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Row(
              children: [
                Column(
                  children: [
                    Container(
                      height: screenHeight * 0.10,
                      width: screenWidth * 0.98,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[800],
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              FlatButton(
                                onPressed: () {
                                  /*...*/
                                },
                                child: Text(
                                  "Delete",
                                ),
                              ),
                              FlatButton(
                                onPressed: () async {
                                  await _query.deleteAll();
                                },
                                child: Text(
                                  "Delete All",
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "$total",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: [
                              ToggleSwitch(
                                initialLabelIndex: 0,
                                labels: ['Table A', 'Table B'],
                                onToggle: (index) {
                                  print('switched to: $index');
                                },
                              ),
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Text(
                                "Member",
                              ),
                              SizedBox(width: 10.0),
                              RaisedButton(
                                onPressed: null,
                                child: Text("Checkout"),
                                padding: EdgeInsets.all(3.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      // ),
    );
  }
}
