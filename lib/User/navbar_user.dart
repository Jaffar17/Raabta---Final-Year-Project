import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:raabta_fyp/User/counsellorsList_user.dart';
import 'package:raabta_fyp/User/editprofile_user.dart';
import 'package:raabta_fyp/User/home_user.dart';
import 'package:raabta_fyp/User/inbox_user.dart';
import 'package:raabta_fyp/User/user_appointments.dart';

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
    InboxUser(),
    CounsellorsList(),
    HomeUser(),
    UserAppointmentsScreen(),
    EditprofileUser(),
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
        backgroundColor: Color(0xff006A6A),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.solidComment,
                //FontAwesomeIcons.solidNoteSticky,
                size: 30,
                //color: Colors.black12,
                //color: Colors.white24,
                // color: Colors.white30,
              ),
              backgroundColor: Color(0xff006A6A),
              label: "" //"Appointments"
              ),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.userDoctor,
                size: 30,
              ),
              backgroundColor: Color(0xff006A6A),
              label: "" //"Favourites"
              ),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.house,
                size: 30,
              ),
              backgroundColor: Color(0xff006A6A),
              label: "" //"Home"
              ),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.solidCalendar,
                size: 30,
              ),
              backgroundColor: Color(0xff006A6A),
              label: "" //"Messages"
              ),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.addressCard,
                size: 30,
              ),
              backgroundColor: Color(0xff006A6A),
              label: "" //"Profile"
              )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xffF6BD12),
        onTap: _onItemTapped,
      ),
    );
  }
}
