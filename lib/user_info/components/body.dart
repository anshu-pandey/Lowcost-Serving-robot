import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/component/navigation.dart';
import '../../component/header.dart';
import 'package:flutter_application_2/login/component/body.dart' as log;

class body extends StatefulWidget {
  @override
  static TextEditingController name_c = TextEditingController();
  static TextEditingController age_c = TextEditingController();
  static TextEditingController adult_c = TextEditingController();
  static TextEditingController child_c = TextEditingController();
  static TextEditingController table_c = TextEditingController();
  _body createState() {
    return new _body();
  }
}

class _body extends State<body> {
  bool _validate_name = false;
  bool _validate_age = false;
  bool _validate_adult = false;
  bool _validate_child = false;
  bool _validate_table = false;

  Widget build(BuildContext context) {
    final button = ElevatedButton(
      child: const Text(" CONTINUE "),
      onPressed: () {
        setState(() {
          body.name_c.text.isEmpty
              ? _validate_name = true
              : _validate_name = false;
          body.age_c.text.isEmpty
              ? _validate_age = true
              : _validate_age = false;
          body.adult_c.text.isEmpty
              ? _validate_adult = true
              : _validate_adult = false;
          body.child_c.text.isEmpty
              ? _validate_child = true
              : _validate_child = false;
          body.table_c.text.isEmpty
              ? _validate_table = true
              : _validate_table = false;
        });
        if ((_validate_name == false) &
            (_validate_age == false) &
            (_validate_adult == false) &
            (_validate_child == false) &
            (_validate_table == false)) {
          Route route = MaterialPageRoute(builder: (context) => navigation());
          Navigator.push(context, route);
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
          text: '   Input Information',
        ),
        SizedBox(
          height: 30,
        ),
        Input_box(
            'Name',
            'Enter Your Name ',
            Icons.verified_user_rounded,
            TextInputType.name,
            body.name_c,
            "Name can't be Empty",
            _validate_name),
        Input_box(
            'Age',
            'Enter Your Age',
            Icons.unfold_more_sharp,
            TextInputType.number,
            body.age_c,
            "Age can't be Empty",
            _validate_age),
        Input_box(
            'Number of Adult for Dining',
            'Number of Adult for Dining ',
            Icons.format_list_numbered,
            TextInputType.number,
            body.adult_c,
            "Number of Adult can't be Empty",
            _validate_adult),
        Input_box(
            'Number of Children for Dining',
            'Number of Children for Dining',
            Icons.format_list_numbered,
            TextInputType.number,
            body.child_c,
            "No of Children can't be Empty",
            _validate_child),
        Input_box(
            'Table Number',
            'Enter Your Table Number',
            Icons.table_chart_outlined,
            TextInputType.number,
            body.table_c,
            "Table Number can't be Empty",
            _validate_table),
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

  _addUserToFirestore(String userId) async {
    return await log.body.firestore.collection('users').doc(userId).set({
      'time': Timestamp.now(),
      "name": body.name_c.text.trim(),
      "id": userId,
      "table": body.table_c.text.trim(),
      "Phone No": log.body.phoneController.text,
      "cart": []
    });
  }
}
