import 'package:flutter/material.dart';

class NavBarUser extends StatefulWidget {
  const NavBarUser({Key? key}) : super(key: key);

  @override
  State<NavBarUser> createState() => _NavBarUserState();
}

class _NavBarUserState extends State<NavBarUser> {
  int _selectedIndex = 2;

  //static const TextStyle optionStyle =
  //   TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text("Appointments"),
    Text("Appointments"),
    Text("Home"),
    Text("Appointments"),
    Text("Appointments"),
    // ScheduledAppointmentsUser(),
    // FavoritesScreenUser(),
    // HomeScreenUser(),
    // // AllMessages(),
    // ChatScreenUser(),
    // MyProfile(),
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
        backgroundColor: Color(0xffFFFFFF),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.checklist_rounded,
                size: 35.0,
                color: Color(0xff000000),
              ),
              //backgroundColor: Color(0xff006A6A),
              label: "" //"Appointments"
              ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border_rounded,
                size: 35.0,
                color: Color(0xff000000),
              ),
              //backgroundColor: Color(0xff006A6A),
              label: "" //"Favourites"
              ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 35.0,
                color: Color(0xff000000),
              ),
              //backgroundColor: Color(0xff006A6A),
              label: "" //"Home"
              ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat_rounded,
                size: 35.0,
                color: Color(0xff000000),
              ),
              //backgroundColor: Color(0xff006A6A),
              label: "" //"Messages"
              ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_box_rounded,
                size: 35.0,
                color: Color(0xff000000),
              ),
              //backgroundColor: Color(0xff006A6A),
              label: "" //"Profile"
              )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff006A6A),
        onTap: _onItemTapped,
      ),
    );
  }
}
