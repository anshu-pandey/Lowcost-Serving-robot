import 'package:flutter/material.dart';
import 'package:flutter_application_2/OTP/otp.dart';
import 'package:flutter_application_2/login/login.dart';
import 'package:flutter_application_2/logo/logo.dart';

final Map<String, WidgetBuilder> routes = {
  logo.routeName: (context) => logo(),
  otp.routeName: (context) => otp(),
  login.routeName: (context) => login(),
};
