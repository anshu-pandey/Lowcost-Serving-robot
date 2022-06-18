import 'package:flutter/material.dart';

class footer extends StatelessWidget {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  Widget build(BuildContext context) {
    return BottomNavigationBar(
      fixedColor: Color.fromARGB(255, 255, 255, 255),
      backgroundColor: Color.fromARGB(255, 83, 19, 19),
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey,
      elevation: 15,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          label: 'Account',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_bag,
            color: Color.fromARGB(255, 255, 254, 254),
          ),
          label: 'Menu',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fastfood, color: Color.fromARGB(223, 255, 255, 255)),
          label: 'Cart',
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onTap,
    );
  }

  void _onTap(int index) {
    setState() {
      _selectedIndex = index;
    }

    ;
  }
}
