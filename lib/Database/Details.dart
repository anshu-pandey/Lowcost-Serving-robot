class Details {
  String PaymentID;
  String Time;
  String PhoneNo;
  String TableNo;
  String Adult;
  String Child;
  String Name;
  String Age;
  List Order;
  List Quantity;

  Details(this.PaymentID, this.Time, this.PhoneNo, this.TableNo, this.Adult,
      this.Child, this.Name, this.Age, this.Order, this.Quantity);

  String toParams() =>
      "PaymentID=$PaymentID&Time=$Time&PhoneNo=$PhoneNo&TableNo=$TableNo?Adult=$Adult&Child=$Child&Name=$Name&Age=$Age&Order=$Order&Quantity=$Quantity";

  factory Details.fromJson(dynamic json) {
    return Details(
        "${json['PaymentID']}",
        "${json['Time']}",
        "${json['PhoneNo']}",
        "${json['TableNo']}",
        "${json['Adult']}",
        "${json['Child']}",
        "${json['Name']}",
        "${json['Age']}",
        ["${json['Order']}"],
        ["${json['Quantity']}"]);
  }

  // Method to make GET parameters.
  Map toJson() => {
        'PaymentID': PaymentID,
        'Time': Time,
        'PhoneNo': PhoneNo,
        'TableNo': TableNo,
        'Adult': Adult,
        'Child': Child,
        'Name': Name,
        'Age': Age,
        'Order': Order,
        'Quantity': Quantity
      };
}
