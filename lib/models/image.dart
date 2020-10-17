class MyImage {
  int id;
  String name;
  String url;
  String amount;
  String quantity;

  MyImage({this.url, this.amount, this.quantity, this.name});

  MyImage.fromMap(dynamic map) {
    this.url = map['url'];
    this.amount = map['amount'];
    this.quantity = map['quantity'];
    this.name = map['name'];
  }

  String get geturl => url;
  String get getamount => amount;
  String get getquantity => quantity;
  String get getname => name;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['url'] = url;
    map['amount'] = amount;
    map['quantity'] = quantity;
    map['name'] = name;

    return map;
  }
}
