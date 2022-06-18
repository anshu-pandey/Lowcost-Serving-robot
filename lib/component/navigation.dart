import 'package:flutter/material.dart';
import 'package:flutter_application_2/cart/cart.dart';
import 'package:flutter_application_2/homepage/homepage.dart';
import '../cart/CartProduct.dart';
import '../menu/menu.dart';
import '../account/account.dart';

class navigation extends StatefulWidget {
  @override
  _navigation createState() => _navigation();
}

class _navigation extends State<navigation> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    homepage(),
    account(),
    //cart(),
    menu(),
    cart(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: Color.fromARGB(255, 90, 18, 18),
        fixedColor: Colors.black45,
        elevation: 15.0,
        showUnselectedLabels: true,
        unselectedItemColor: Color.fromARGB(255, 0, 0, 0),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.fastfood,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag, color: Color.fromARGB(223, 0, 0, 0)),
            label: 'Cart',
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
