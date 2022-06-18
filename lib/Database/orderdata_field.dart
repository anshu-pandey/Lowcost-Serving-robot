class orderdata_filed {
  static final String PaymentID = "PaymentID";
  static final String Time = "Time";
  static final String PhoneNo = "PhoneNo";
  static final String TableNo = "TableNo";
  static final String Adult = "Adult";
  static final String Child = "Child";
  static final String Name = "Name";
  static final String Age = "Age";
  static final String Order = 'Order';
  static final String Quantity = 'PRICE';

  static List<String> getfields() => [
        PaymentID,
        Time,
        PhoneNo,
        TableNo,
        Adult,
        Child,
        Name,
        Age,
        Order,
        Quantity,
      ];
}
