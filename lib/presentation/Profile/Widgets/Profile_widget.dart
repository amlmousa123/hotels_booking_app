import 'package:flutter/material.dart';

import '../screens/profile2.dart';

class Profile_Widget extends StatefulWidget {
  const Profile_Widget({Key? key}) : super(key: key);

  @override
  State<Profile_Widget> createState() => _Profile_WidgetState();
}

class _Profile_WidgetState extends State<Profile_Widget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Explore',
      style: optionStyle,
    ),
    Text(
      'Trips',
      style: optionStyle,
    ),
  profile2(),
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
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[800],
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Trips',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        //selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
