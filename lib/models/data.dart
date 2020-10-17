class Data {
  int id;
  String name;
  String number;
  String amount;
  String price;

  Data({this.name, this.number, this.amount, this.price});

  Data.fromMap(dynamic map) {
    this.name = map['name'];
    this.number = map['number'];
    this.amount = map['amount'];
    this.price = map['price'];
  }

  String get getname => name;
  String get getnumber => number;
  String get getamount => amount;
  String get getprice => price;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['getname'] = name;
    map['getnumber'] = number;
    map['getamount'] = amount;
    map['getprice'] = price;

    return map;
  }
}
