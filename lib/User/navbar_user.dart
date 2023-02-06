import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
              icon: FaIcon(
                FontAwesomeIcons.solidComment,
                //FontAwesomeIcons.solidNoteSticky,
                size: 30,
                color: Colors.black12,
                //color: Colors.white24,
                // color: Colors.white30,
              ),
              //backgroundColor: Color(0xff006A6A),
              label: "" //"Appointments"
              ),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.handHoldingHand,
                size: 30,
              ),
              //backgroundColor: Color(0xff006A6A),
              label: "" //"Favourites"
              ),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.house,
                size: 30,
              ),
              //backgroundColor: Color(0xff006A6A),
              label: "" //"Home"
              ),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.solidCalendar,
                size: 30,
              ),
              //backgroundColor: Color(0xff006A6A),
              label: "" //"Messages"
              ),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.solidUser,
                size: 30,
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
