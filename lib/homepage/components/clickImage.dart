import 'package:flutter/material.dart';

class clickImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: MediaQuery.of(context).size.height * 0.03),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        GD_image("assets/indian.png", "INDIAN FOOD", context),
        GD_image("assets/italian.png", "ITALIAN FOOD", context),
      ]),
      SizedBox(height: MediaQuery.of(context).size.height * 0.03),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        GD_image("assets/chinese.png", "CHINESE FOOD", context),
        GD_image("assets/american_fastfood.png", "AMERICAN FAST FOOD", context),
      ]),
      SizedBox(height: MediaQuery.of(context).size.height * 0.03),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        GD_image("assets/barbeque.png", "BARBEQUE", context),
        GD_image("assets/korean.png", "KOREAN FOOD", context),
      ]),
      SizedBox(height: MediaQuery.of(context).size.height * 0.03),
    ]);
  }

  GD_image(String image_name, String Image_text, context) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              image_name,
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.width * 0.3,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.02,
          ),
          small_case(Image_text),
        ],
      ),
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.width * 0.4,
      //color: Color.fromARGB(236, 243, 241, 241),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
        color: Color.fromARGB(236, 243, 241, 241),
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
            fontSize: 15,
            decoration: TextDecoration.none));
  }
}
