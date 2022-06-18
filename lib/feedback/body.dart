import 'package:flutter/material.dart';
import 'package:flutter_application_2/feedback/UserSheetsApi.dart';
import 'package:flutter_application_2/feedback/feedback.dart';
import 'package:flutter_application_2/feedback/form_feedback.dart';
import 'package:flutter_application_2/feedback/controller.dart';
import 'package:flutter_application_2/feedback/userfield.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../component/header.dart';

class body extends StatefulWidget {
  @override
  static TextEditingController about_food = TextEditingController();
  static TextEditingController rating = TextEditingController();
  static TextEditingController concept_of_robot = TextEditingController();
  static TextEditingController any_improvment = TextEditingController();
  static TextEditingController rating_of_robot = TextEditingController();
  _body createState() {
    return new _body();
  }
}

class _body extends State<body> {
  bool _validate_about_food = false;
  bool _validate_rating = false;
  bool _validate_concept_of_robot = false;
  bool _validate_any_improvment = false;
  bool _rating_of_robot = false;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void _submitForm() {
    // Validate returns true if the form is valid, or false
    // otherwise.

    form_feedback feedbackForm = form_feedback(
      body.about_food.text,
      body.rating.text,
      body.concept_of_robot.text,
      body.any_improvment.text,
      body.rating_of_robot.text,
    );

    FormController formController = FormController();

    // Submit 'feedbackForm' and save it in Google Sheets.
    formController.submitForm(feedbackForm, (String response) {
      print("Response: $response");
      if (response == FormController.STATUS_SUCCESS) {
        Fluttertoast.showToast(msg: "SUCCESS: ", timeInSecForIos: 4);
      } else {
        // Error Occurred while saving data in Google Sheets.
        Fluttertoast.showToast(msg: "Failed ", timeInSecForIos: 4);
      }
    });
  }

  Widget build(BuildContext context) {
    final button = ElevatedButton(
      child: const Text(" SUBMIT "),
      onPressed: () async {
        setState(() {
          body.about_food.text.isEmpty
              ? _validate_about_food = true
              : _validate_about_food = false;
          body.rating.text.isEmpty
              ? _validate_rating = true
              : _validate_rating = false;
          body.concept_of_robot.text.isEmpty
              ? _validate_concept_of_robot = true
              : _validate_concept_of_robot = false;
          body.any_improvment.text.isEmpty
              ? _validate_any_improvment = true
              : _validate_any_improvment = false;
          body.rating_of_robot.text.isEmpty
              ? _rating_of_robot = true
              : _rating_of_robot = false;
        });
        if ((_validate_about_food == false) &
            (_validate_rating == false) &
            (_validate_concept_of_robot == false) &
            (_validate_any_improvment == false) &
            (_rating_of_robot == false)) {
          //      Route route = MaterialPageRoute(builder: (context) => navigation());
          //      Navigator.push(context, route);
          //   _submitForm;
          final dynamic feed = {
            userfields.How_was_the_food: body.about_food.text,
            userfields.Rating: body.rating.text,
            userfields.Do_you_like_the_concept_of_Robot_as_a_waiter:
                body.concept_of_robot.text,
            userfields.Rating_for_the_robot: body.any_improvment.text,
            userfields.Please_tell_your_overall_experience:
                body.rating_of_robot.text,
          };
          await UserSheetsApi.insert([feed]);
        }
      },
      style: ElevatedButton.styleFrom(
        primary: const Color.fromARGB(255, 80, 27, 27),
      ),
    );
    return SingleChildScrollView(
        child: Column(
      children: [
        header(
          text: '   Feedback Form',
        ),
        SizedBox(
          height: 30,
        ),
        small_case("Please Provide Feedback for our improvment"),
        Input_box(
            'How was the food?',
            'Please Tell about the food if any improvments are requried',
            Icons.verified_user_rounded,
            TextInputType.name,
            body.about_food,
            "This field can't be empty",
            _validate_about_food),
        Input_box(
            'Rating',
            'Give the rating for the food',
            Icons.unfold_more_sharp,
            TextInputType.number,
            body.rating,
            "This field can't be empty",
            _validate_rating),
        Input_box(
            'Do you like the concept of Robot as a waiter',
            'Do you like the concept of Robot as a waiter',
            Icons.format_list_numbered,
            TextInputType.name,
            body.concept_of_robot,
            "This field can't be empty",
            _validate_concept_of_robot),
        Input_box(
            'Rating for the robot',
            'Rating for the robot',
            Icons.hardware,
            TextInputType.number,
            body.rating_of_robot,
            "This field can't be empty",
            _rating_of_robot),
        Input_box(
            'Please tell your overall experience and any improvment needed',
            'Please tell your overall experience and any improvment needed',
            Icons.format_list_numbered,
            TextInputType.name,
            body.any_improvment,
            "This field can't be empty",
            _validate_any_improvment),
        button,
      ],
    ));
  }

  Widget Input_box(String label_text, String hint_text, icon, key_bo,
      TextEditingController control, error_text, validator) {
    return Padding(
      padding: EdgeInsets.all(25.0),
      child: TextFormField(
        keyboardType: key_bo,
        controller: control,
        decoration: InputDecoration(
          labelText: label_text,
          labelStyle: TextStyle(color: Color.fromARGB(255, 105, 25, 25)),
          hintText: hint_text,
          errorText: validator ? error_text : null,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(
            icon,
            color: Color.fromARGB(255, 105, 25, 25),
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

  Text small_case(String text) {
    return Text(text,
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontFamily: 'JosefinSans',
            fontWeight: FontWeight.w700,
            fontSize: 20,
            decoration: TextDecoration.none));
  }
}
