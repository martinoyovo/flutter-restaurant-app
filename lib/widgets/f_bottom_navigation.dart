import 'package:flutter/material.dart';
import 'package:restaurant_app/core/utils/colors.dart';
import 'package:restaurant_app/pages/driver/order/tracking.dart';
import 'package:restaurant_app/pages/home.dart';
import 'package:restaurant_app/pages/home_snd.dart';
import 'package:restaurant_app/pages/profile/profile_screen.dart';
import 'package:restaurant_app/pages/saved/main_screen.dart';
import 'package:restaurant_app/widgets/f_carousel.dart';


/// This is the stateful widget that the main application instantiates.
class FBottomNavigationBar extends StatefulWidget {

  @override
  _FBottomNavigationBarState createState() => _FBottomNavigationBarState();
}


class _FBottomNavigationBarState extends State<FBottomNavigationBar> {
  int _selectedIndex = 0;
  static const TextStyle _unselectedLabelStyle =
  TextStyle(color: Colors.grey);
  List<Widget> _widgetOptions = <Widget>[
    HomeSnd(),
    Tracking(),
    MainScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_outlined),
            label: 'My Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_rounded),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: _unselectedLabelStyle,
        onTap: _onItemTapped,
      ),
    );
  }
}
