// ignore_for_file: unused_element

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/login/component/spalsh.dart';
import 'package:flutter_application_2/OTP/otp.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:logger/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_2/user_info/components/body.dart'
    as user_info;

var logger = Logger();

class body extends StatelessWidget {
  static String routeName = "/login";
  static String userId = '';

  static FirebaseAuth auth = FirebaseAuth.instance;

  static var firebaseUser = auth.currentUser;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool otpVisibility = false;
  static String verificationID = "";

  static TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      child: const Text("Send Me a Code"),
      onPressed: () {
        loginWithPhone(context);
        //if
        //Route route = MaterialPageRoute(builder: (context) => otp());
        //Navigator.push(context, route);
      },
      style: ElevatedButton.styleFrom(
        primary: const Color.fromARGB(255, 80, 27, 27),
      ),
    );
    return Column(children: [
      Container(
        child: spalsh(),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.50,
      ),
      const SizedBox(
        height: 10,
      ),
      intro_text(),
      enter_number(),
      accepting_policy(),
      const SizedBox(
        height: 5,
      ),
      button,
    ]);
  }

  void loginWithPhone(BuildContext context) async {
    auth.verifyPhoneNumber(
      phoneNumber: phoneController.text,
      timeout: Duration(seconds: 30),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) async {
          userId = value.user!.uid;

          print("userID  : {$userId}");
          print("You are logged in successfully");
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        otpVisibility = true;
        logger.d(verificationId);
        verificationID = verificationId;
        Route route = MaterialPageRoute(builder: (context) => otp());
        Navigator.push(context, route);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Widget enter_number() {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: TextFormField(
        controller: phoneController,
        keyboardType: TextInputType.phone,
        decoration: const InputDecoration(
          labelText: "Phone Number",
          labelStyle: TextStyle(color: Color.fromARGB(255, 90, 30, 30)),
          hintText: "Enter your Phone Number",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(
            Icons.phone_android_outlined,
            color: Color.fromARGB(255, 80, 27, 27),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(255, 90, 30, 30), width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(255, 90, 30, 30), width: 2.0),
          ),
        ),
      ),
    );
  }

  Text intro_text() {
    return const Text(
        "LET'S SIGN IN OR CREATE ACCOUNT \n WITH YOUR PHONE NUMBER!",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontFamily: 'JosefinSans',
            fontWeight: FontWeight.bold,
            fontSize: 20,
            decoration: TextDecoration.none));
  }

  Text accepting_policy() {
    return const Text(
        'By " logging in FORONIC ALCHEMIST ", you agree to our \n PRIVACY POLICY and TERMS  & CONDITIONS',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontFamily: 'JosefinSans',
            fontWeight: FontWeight.w600,
            fontSize: 13,
            decoration: TextDecoration.none));
  }

  _addUserToFirestore(String userId) {
    firestore.collection('users').doc(userId).set({
      "name": user_info.body.name_c.text.trim(),
      "id": userId,
      "table": user_info.body.table_c.text.trim(),
      "Phone No": phoneController.text,
      "cart": []
    });
  }
}
