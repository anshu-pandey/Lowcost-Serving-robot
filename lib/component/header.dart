import 'package:flutter/material.dart';

class header extends StatelessWidget with PreferredSizeWidget {
  @override
  const header({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 105, 25, 25),
      toolbarHeight: MediaQuery.of(context).size.height / 11,
      title: Row(
        children: [
          Image.asset(
            'assets/logo.png',
            height: MediaQuery.of(context).size.height / 9,
            alignment: Alignment.topLeft,
          ),
          const SizedBox(
            width: 1,
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Text(text,
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontFamily: 'JosefinSans',
                    fontWeight: FontWeight.w900)),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
