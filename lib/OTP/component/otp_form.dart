import 'package:flutter/material.dart';
import 'package:flutter_application_2/OTP/component/body.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({
    Key? key,
  }) : super(key: key);

  static TextEditingController otpController = TextEditingController();
  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder outlineInputBorder() {
      return OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.width / 12),
        borderSide: const BorderSide(color: Color.fromARGB(255, 97, 37, 33)),
      );
    }

    final otpInputDecoration = InputDecoration(
      contentPadding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.02),
      border: outlineInputBorder(),
      focusedBorder: outlineInputBorder(),
      enabledBorder: outlineInputBorder(),
    );

    return Form(
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 5,
              child: TextFormField(
                controller: OtpForm.otpController,
                autofocus: true,
                obscureText: true,
                style: TextStyle(fontSize: 24),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: otpInputDecoration,
                onChanged: (value) {
                  nextField(value, pin2FocusNode);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
