class Item {
  int id;
  String item;

  Item({this.item});

  Item.fromMap(dynamic map) {
    this.item = map['item'];
  }

  String get getitem => item;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['getitem'] = item;

    return map;
  }
}
