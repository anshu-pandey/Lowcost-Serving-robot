import 'package:flutter/material.dart';
import 'package:flutter_application_2/account/account.dart';
import 'package:flutter_application_2/payment/success_page.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:flutter_application_2/user_info/components/body.dart'
    as user_info;
import 'package:flutter_application_2/login/component/body.dart' as log;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_2/Database/Details.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../cart/cart_controller.dart';
import 'package:flutter_application_2/Database/form_controller.dart';
import 'package:flutter_application_2/Database/orderdata_field.dart';
import 'package:flutter_application_2/Database/userdata_sheet_api.dart';
import 'package:collection/collection.dart';

class loading_screen extends StatefulWidget {
  payment createState() => payment();
}

@override
class payment extends State<loading_screen> {
  late Razorpay razorpay;
  final CartController controller = Get.find();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void initState() {
    super.initState();
    razorpay = new Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerPaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerPaymentexternal_wallet);
  }

  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  void handlerPaymentSuccess(PaymentSuccessResponse response) async {
    submitForm_database(response.paymentId);
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId, timeInSecForIos: 4);

    Route route = MaterialPageRoute(
        builder: (context) => success_page(
              paymentID: response.paymentId,
            ));

    Navigator.push(context, route);
  }

  void handlerPaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message,
        timeInSecForIos: 4);
  }

  void handlerPaymentexternal_wallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName, timeInSecForIos: 4);
  }

  void openCheckout() {
    var option = {
      "key": "",
      "amount": 100,
      "name": user_info.body.name_c.text,
      "description": "Payment for food",
      "prefill": {
        "contact": log.body.phoneController.text,
      },
      "external": {
        "wallets": ["paytm"]
      }
    };
    try {
      razorpay.open(option);
    } catch (e) {
      print(e.toString());
    }
  }

  submitForm_database(paymentID) async {
    List productList = controller.product.keys.toList();
    List quantity = controller.product.values.toList();
    List food_id = [];
    List price = [];
    productList.asMap().forEach((idx, val) {
      food_id.add(val.food_id);
      price.add(val.price);
    });
    print(food_id);
    var sum = price.reduce((a, b) => a + b);

    final Map<String, dynamic> feed = {
      orderdata_filed.PaymentID: paymentID,
      orderdata_filed.Time: DateTime.now().toString(),
      orderdata_filed.PhoneNo: log.body.phoneController.text,
      orderdata_filed.TableNo: user_info.body.table_c.text,
      orderdata_filed.Adult: user_info.body.adult_c.text,
      orderdata_filed.Child: user_info.body.child_c.text,
      orderdata_filed.Name: user_info.body.name_c.text,
      orderdata_filed.Age: user_info.body.age_c.text,
      orderdata_filed.Order: food_id.toString(),
      orderdata_filed.Quantity: sum.toString(),
    };
    await userdataSheetsApi.insert([feed]);
  }

  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: () async {
        openCheckout();
      },
      child: Text('Proceed To Payment'),
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(Color.fromARGB(255, 102, 11, 11)),
      ),
    );
  }
}
