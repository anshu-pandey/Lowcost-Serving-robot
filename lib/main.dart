import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Database/userdata_sheet_api.dart';
import 'package:flutter_application_2/routes.dart';
import 'package:flutter_application_2/logo/logo.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:flutter_application_2/feedback/UserSheetsApi.dart';

import 'cart/cart_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await UserSheetsApi.init();
  await userdataSheetsApi.init();
  final cartController = Get.put(CartController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: logo(),
      routes: routes,
    );
  }
}
