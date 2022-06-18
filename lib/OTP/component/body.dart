import 'package:flutter/material.dart';
import 'package:flutter_application_2/OTP/component/otp_form.dart';
import 'package:flutter_application_2/component/header.dart';
import 'package:flutter_application_2/login/component/body.dart' as login;
import 'package:flutter_application_2/user_info/user_info.dart';
import 'package:firebase_auth/firebase_auth.dart';

class body extends StatelessWidget {
  static TextEditingController otpController = OtpForm.otpController;
  String verificationID = login.body.verificationID;
  FirebaseAuth auth = login.body.auth;
  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      child: const Text(" Verify "),
      onPressed: () {
        // Navigator.pushNamed(context, otp.routeName);
        //    Route route = MaterialPageRoute(builder: (context) => otp());
        //  Navigator.push(context, route);
        verifyOTP(context);
      },
      style: ElevatedButton.styleFrom(
        primary: const Color.fromARGB(255, 80, 27, 27),
      ),
    );
    return Column(children: [
      const header(text: " "),
      const SizedBox(
        height: 30,
      ),
      small_case("Sign in/Sign up"),
      const SizedBox(
        height: 30,
      ),
      Image.asset(
        "assets/logo.png",
        height: MediaQuery.of(context).size.height / 5,
        width: MediaQuery.of(context).size.height / 5,
      ),
      const SizedBox(
        height: 30,
      ),
      larger_case("WE JUST TEXTED YOU"),
      const SizedBox(
        height: 30,
      ),
      small_case(
          "Please enter the verification code we \n have just sent to your phone number"),
      OtpForm(),
      SizedBox(
        height: 30,
      ),
      button,
      buildTimer(),
    ]);
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        small_case("This code will expired in "),
        TweenAnimationBuilder<Duration>(
            duration: Duration(seconds: 30),
            tween: Tween(begin: Duration(seconds: 30), end: Duration.zero),
            builder: (BuildContext context, Duration value, Widget? child) {
              final seconds = value.inSeconds;
              return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: small_case('00:$seconds'));
            }),
      ],
    );
  }

  Text small_case(String text) {
    return Text(text,
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontFamily: 'JosefinSans',
            fontWeight: FontWeight.w700,
            fontSize: 15,
            decoration: TextDecoration.none));
  }

  Text larger_case(String text) {
    return Text(text,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontFamily: 'JosefinSans',
            fontWeight: FontWeight.bold,
            fontSize: 25,
            decoration: TextDecoration.none));
  }

  void verifyOTP(BuildContext context) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otpController.text);

    await auth.signInWithCredential(credential).then((value) {
      print("You are logged in successfully");

      // homepage
      Route route = MaterialPageRoute(builder: (context) => user_info());
      Navigator.push(context, route);
      //
    });
  }
}
